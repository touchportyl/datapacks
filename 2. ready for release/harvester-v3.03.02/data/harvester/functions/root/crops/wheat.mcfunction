# this code harvests and replants one plot of wheat


# harvest
execute if entity @s[tag=HV_wheat] run setblock ~ ~1 ~ minecraft:wheat[age=0] destroy
execute if entity @s[tag=!HV_wheat] run setblock ~ ~1 ~ minecraft:air destroy

# xp reward for replanting
execute if entity @s[tag=HV_wheat] run function harvester:effects/xporb
# bonus xp
execute if entity @s[tag=HV_wheat] if score CONFIG$harvestxpbonus Harvester = BOOL$true DatapackManager if score RAND$4 Harvester matches 1 run function harvester:effects/xporb

# remove seeds
execute if entity @s[tag=HV_wheat] if score RAND$4 Harvester matches 2 run clear @s minecraft:wheat_seeds 1

# grant advancement
advancement grant @s[tag=HV_wheat] only harvester:you_can_do_that

# semi-persistent tag
tag @s[tag=HV_wheat] add HV_success