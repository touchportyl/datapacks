# this code controls the harvesting process


#> wheat
execute if block ~ ~1 ~ minecraft:wheat[age=7] run function harvester:root/crops/wheat

#> potato
execute if block ~ ~1 ~ minecraft:potatoes[age=7] run function harvester:root/crops/potato

#> carrot
execute if block ~ ~1 ~ minecraft:carrots[age=7] run function harvester:root/crops/carrot

#> beetroot
execute if block ~ ~1 ~ minecraft:beetroots[age=3] run function harvester:root/crops/beetroot

#> netherwart
execute if entity @s[tag=HV_nether] if block ~ ~1 ~ minecraft:nether_wart[age=3] run function harvester:root/crops/netherwart
