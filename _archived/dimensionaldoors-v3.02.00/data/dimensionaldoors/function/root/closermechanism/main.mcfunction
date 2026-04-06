# play teleport and closing door sound
# this is for the door that just closed
execute unless score @s DimensionalDoors matches 5.. run function dimensionaldoors:effects/teleporteffects
execute if block ~ ~ ~ #minecraft:doors[powered=false] run function dimensionaldoors:effects/doorclose


# door closing mechanism
# do not close the door if it is powered

# Minecraft 1.14 - 1.15
execute if score VERSION$minecraft.current DatapackManager matches 14..15 if block ~ ~ ~ #minecraft:doors[powered=false] run function dimensionaldoors:root/closermechanism/v1

# Minecraft 1.16 ++
execute if score VERSION$minecraft.current DatapackManager matches 16.. if block ~ ~ ~ #minecraft:doors[powered=false] run function dimensionaldoors:root/closermechanism/v2


# cleanup
tag @s remove DD_close
scoreboard players reset @s DimensionalDoors