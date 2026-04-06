# this code positions the harvesting controller
#
# manually detect the 9 plots because it's simpler
#  22 10 11 12 23
#  21 09 02 03 13
#  20 08 01 04 14
#  19 07 06 05 15
#  25 18 17 16 24


execute positioned ~ ~ ~ run function harvester:root/crops/filter
execute positioned ~1 ~ ~ run function harvester:root/crops/filter
execute positioned ~1 ~ ~1 run function harvester:root/crops/filter
execute positioned ~ ~ ~1 run function harvester:root/crops/filter
execute positioned ~-1 ~ ~1 run function harvester:root/crops/filter
execute positioned ~-1 ~ ~ run function harvester:root/crops/filter
execute positioned ~-1 ~ ~-1 run function harvester:root/crops/filter
execute positioned ~ ~ ~-1 run function harvester:root/crops/filter
execute positioned ~1 ~ ~-1 run function harvester:root/crops/filter
execute positioned ~2 ~ ~-1 run function harvester:root/crops/filter
execute positioned ~2 ~ ~ run function harvester:root/crops/filter
execute positioned ~2 ~ ~1 run function harvester:root/crops/filter
execute positioned ~1 ~ ~2 run function harvester:root/crops/filter
execute positioned ~ ~ ~2 run function harvester:root/crops/filter
execute positioned ~-1 ~ ~2 run function harvester:root/crops/filter
execute positioned ~-2 ~ ~1 run function harvester:root/crops/filter
execute positioned ~-2 ~ ~ run function harvester:root/crops/filter
execute positioned ~-2 ~ ~-1 run function harvester:root/crops/filter
execute positioned ~-1 ~ ~-2 run function harvester:root/crops/filter
execute positioned ~ ~ ~-2 run function harvester:root/crops/filter
execute positioned ~1 ~ ~-2 run function harvester:root/crops/filter
execute positioned ~2 ~ ~-2 run function harvester:root/crops/filter
execute positioned ~2 ~ ~2 run function harvester:root/crops/filter
execute positioned ~-2 ~ ~-2 run function harvester:root/crops/filter
execute positioned ~-2 ~ ~2 run function harvester:root/crops/filter