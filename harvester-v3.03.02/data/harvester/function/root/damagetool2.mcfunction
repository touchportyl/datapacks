# multiply by 1000000 to accurately do percentage calculation
# limited to numbers under 2147483647 (32-bit int limit)
scoreboard players set TEMP$b HV_damagetool 1000000
scoreboard players operation @s HV_damagetool *= TEMP$b HV_damagetool

# aim the remaining durability half a point below the target: set_damage floors its float result,
# so an exact fraction can round back to the old damage and the harvest would cost nothing
scoreboard players remove @s HV_damagetool 500000

# divide by the durability to get a percentage
scoreboard players operation @s HV_damagetool /= TEMP$a HV_damagetool

# write new value back into item NBT
# scale of 0.000001 is used to convert back to floating point
# the item modifier format changed in 1.20.5, 1.21 and 26.3, so each format has its own modifiers and caller
execute if score VERSION$minecraft.current DatapackManager matches ..12004 run function harvester:compatibility/setdamage-1.19.4
execute if score VERSION$minecraft.current DatapackManager matches 12005..12101 run function harvester:compatibility/setdamage-1.20.5
execute if score VERSION$minecraft.current DatapackManager matches 12102..12602 run function harvester:compatibility/setdamage-1.21.2
execute if score VERSION$minecraft.current DatapackManager matches 12603.. run function harvester:compatibility/setdamage-26.3
