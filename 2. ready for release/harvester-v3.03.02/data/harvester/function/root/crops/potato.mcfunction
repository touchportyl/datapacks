# this code harvests and replants one plot of potato


# harvest
execute if entity @s[tag=HV_potato] run setblock ~ ~1 ~ minecraft:potatoes[age=0] destroy
execute if entity @s[tag=!HV_potato] run setblock ~ ~1 ~ minecraft:air destroy

# xp reward for replanting
execute if entity @s[tag=HV_potato] run function harvester:effects/xporb
# bonus xp
execute if entity @s[tag=HV_potato] if score CONFIG$harvestxpbonus Harvester = BOOL$true DatapackManager if score RAND$4 Harvester matches 1 run function harvester:effects/xporb

# remove seeds
execute if entity @s[tag=HV_potato] if score RAND$4 Harvester matches 2 run clear @s minecraft:potato 1

# grant advancement
advancement grant @s[tag=HV_potato] only harvester:you_can_do_that

# semi-persistent tag
tag @s[tag=HV_potato] add HV_success
