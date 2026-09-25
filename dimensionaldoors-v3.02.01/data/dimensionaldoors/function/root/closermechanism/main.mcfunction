# play teleport and closing door sound
# this is for the door that just closed
execute unless score @s DimensionalDoors matches 5.. run function dimensionaldoors:effects/teleporteffects
execute if block ~ ~ ~ #minecraft:doors[powered=false] run function dimensionaldoors:effects/doorclose

# door closing mechanism
# do not close the door if it is powered

# Minecraft 1.14 - 1.15
execute if score VERSION$minecraft.current.minor DatapackManager matches 14..15 if block ~ ~ ~ #minecraft:doors[powered=false] run function dimensionaldoors:root/closermechanism/v1

# Minecraft 1.16 - 1.20 (1.21 and 1.21.1 report as 1.20.5 and land here too)
execute if score VERSION$minecraft.current.minor DatapackManager matches 16..20 if block ~ ~ ~ #minecraft:doors[powered=false] run function dimensionaldoors:root/closermechanism/v2

# Minecraft 1.21.2 - 1.21.3
# setblock still rebuilds the placed lower half from the open upper half here, so the replace in v1
# fails with "Could not set the block" and the door stays open; v2 destroys and rebuilds, which works
execute if score VERSION$minecraft.current DatapackManager matches 12100..12103 if block ~ ~ ~ #minecraft:doors[powered=false] run function dimensionaldoors:root/closermechanism/v2

# Minecraft 1.21.4 ++
execute if score VERSION$minecraft.current DatapackManager matches 12104.. if block ~ ~ ~ #minecraft:doors[powered=false] run function dimensionaldoors:root/closermechanism/v1

# cleanup
tag @s remove DD_close
scoreboard players reset @s DimensionalDoors
