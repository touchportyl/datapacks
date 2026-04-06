# this code positions the harvesting controller
#
# manually detect the 9 plots because it's simpler
# 9 2 3
# 8 1 4
# 7 6 5


execute positioned ~ ~ ~ run function harvester:root/crops/filter
execute positioned ~1 ~ ~ run function harvester:root/crops/filter
execute positioned ~1 ~ ~1 run function harvester:root/crops/filter
execute positioned ~ ~ ~1 run function harvester:root/crops/filter
execute positioned ~-1 ~ ~1 run function harvester:root/crops/filter
execute positioned ~-1 ~ ~ run function harvester:root/crops/filter
execute positioned ~-1 ~ ~-1 run function harvester:root/crops/filter
execute positioned ~ ~ ~-1 run function harvester:root/crops/filter
execute positioned ~1 ~ ~-1 run function harvester:root/crops/filter
