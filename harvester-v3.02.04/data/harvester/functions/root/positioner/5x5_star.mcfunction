# this code positions the harvesting controller
#
# manually detect the 9 plots because it's simpler
#     10 11 12
#  21 09 02 03 13
#  20 08 01 04 14
#  19 07 06 05 15
#     18 17 16


execute positioned ~ ~ ~ run function harvester:root/harvest/filter
execute positioned ~1 ~ ~ run function harvester:root/harvest/filter
execute positioned ~1 ~ ~1 run function harvester:root/harvest/filter
execute positioned ~ ~ ~1 run function harvester:root/harvest/filter
execute positioned ~-1 ~ ~1 run function harvester:root/harvest/filter
execute positioned ~-1 ~ ~ run function harvester:root/harvest/filter
execute positioned ~-1 ~ ~-1 run function harvester:root/harvest/filter
execute positioned ~ ~ ~-1 run function harvester:root/harvest/filter
execute positioned ~1 ~ ~-1 run function harvester:root/harvest/filter
execute positioned ~2 ~ ~-1 run function harvester:root/harvest/filter
execute positioned ~2 ~ ~ run function harvester:root/harvest/filter
execute positioned ~2 ~ ~1 run function harvester:root/harvest/filter
execute positioned ~1 ~ ~2 run function harvester:root/harvest/filter
execute positioned ~ ~ ~2 run function harvester:root/harvest/filter
execute positioned ~-1 ~ ~2 run function harvester:root/harvest/filter
execute positioned ~-2 ~ ~1 run function harvester:root/harvest/filter
execute positioned ~-2 ~ ~ run function harvester:root/harvest/filter
execute positioned ~-2 ~ ~-1 run function harvester:root/harvest/filter
execute positioned ~-1 ~ ~-2 run function harvester:root/harvest/filter
execute positioned ~ ~ ~-2 run function harvester:root/harvest/filter
execute positioned ~1 ~ ~-2 run function harvester:root/harvest/filter