# this code harvests and replants one plot of beetroot


# harvest
execute if entity @s[tag=HV_beetroot] run setblock ~ ~1 ~ minecraft:beetroots[age=0] destroy
execute if entity @s[tag=!HV_beetroot] run setblock ~ ~1 ~ minecraft:air destroy

# xp reward for replanting
execute if entity @s[tag=HV_beetroot] if score CONFIG$beetroot.xp Harvester = BOOL$true DatapackManager run summon experience_orb ~ ~ ~ {Age:5960,Health:1,Value:1}
execute if score RAND$4 Harvester matches 1 if score CONFIG$beetroot.xp.bonus Harvester = BOOL$true DatapackManager run summon experience_orb ~ ~ ~ {Age:5960,Health:1,Value:1}

# remove seeds
execute if entity @s[tag=HV_beetroot] if score RAND$4 Harvester matches 1 run clear @s minecraft:beetroot_seeds 1

# success
execute as @s run function harvester:root/harvest/success