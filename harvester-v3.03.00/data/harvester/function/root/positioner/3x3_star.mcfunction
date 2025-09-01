# this code positions the harvesting controller
#
# manually detect the 5 plots because it's simpler
#   2
# 5 1 3
#   4


execute positioned ~ ~ ~ run function harvester:root/crops/filter
execute positioned ~1 ~ ~ run function harvester:root/crops/filter
execute positioned ~ ~ ~1 run function harvester:root/crops/filter
execute positioned ~-1 ~ ~ run function harvester:root/crops/filter
execute positioned ~ ~ ~-1 run function harvester:root/crops/filter