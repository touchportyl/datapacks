# multiply by 1000000 to accurately do percentage calculation
# limited to numbers under 2147483647 (32-bit int limit)
scoreboard players set TEMP$b HV_damagetool 1000000
scoreboard players operation @s HV_damagetool *= TEMP$b HV_damagetool

# divide by the durability to get a percentage
scoreboard players operation @s HV_damagetool /= TEMP$a HV_damagetool

# write new value back into item NBT
# scale of 0.000001 is used to convert back to floating point
item modify entity @s weapon.mainhand harvester:unbreaking0
item modify entity @s weapon.mainhand harvester:unbreaking1
item modify entity @s weapon.mainhand harvester:unbreaking2
item modify entity @s weapon.mainhand harvester:unbreaking3