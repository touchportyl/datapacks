# this code harvests and replants one plot of wheat


# harvest
execute if entity @s[tag=HV_wheat] run setblock ~ ~1 ~ minecraft:wheat[age=0] destroy
execute if entity @s[tag=!HV_wheat] run setblock ~ ~1 ~ minecraft:air destroy

# xp reward for replanting
execute if entity @s[tag=HV_wheat] run summon experience_orb ~ ~ ~ {Age:5960,Health:1,Value:1}
execute if score RAND$4 Harvester matches 1 run summon experience_orb ~ ~ ~ {Age:5960,Health:1,Value:1}

# remove seeds
execute if entity @s[tag=HV_wheat] if score RAND$4 Harvester matches 1 run clear @s minecraft:wheat_seeds 1

# grant advancement
advancement grant @s only harvester:you_can_do_that

# semi-persistent tag
tag @s add HV_success