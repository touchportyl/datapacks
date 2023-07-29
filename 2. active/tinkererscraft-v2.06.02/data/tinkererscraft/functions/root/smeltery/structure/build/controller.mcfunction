# this code checks the multiblock structure and prepares it for initialization

# tags:
# - TinkerersCraft (default persisting tag for all entities created by Tinkerer's Craft)
# - TC_smeltery (persisting smeltery tag)
# - TC_<direction> (persisting smeltery direction: north, south, east, west)
# - TC_outputnull (sets the display to show the hint)


# multiblock structure check
function tinkererscraft:root/smeltery/structure/build/multiblockcheck


# initialize smeltery
execute as @s at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:root/smeltery/structure/build/initialize