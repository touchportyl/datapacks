# play teleport and closing door sound
# this is for the door that just closed
execute unless score @s DimensionalDoors matches 5.. run function dimensionaldoors:effects/teleporteffects
execute if block ~ ~ ~ #minecraft:doors[powered=false] run function dimensionaldoors:effects/doorclose


# door closing mechanism
# do not close the door if it is powered

# Minecraft 1.14 - 1.15
execute if score VERSION$minecraft.current.minor DatapackManager matches 14..15 if block ~ ~ ~ #minecraft:doors[powered=false] run function dimensionaldoors:root/closermechanism/v1

# Minecraft 1.16 - 1.20
execute if score VERSION$minecraft.current.minor DatapackManager matches 16..20 if block ~ ~ ~ #minecraft:doors[powered=false] run function dimensionaldoors:root/closermechanism/v2

# Minecraft 1.21 ++
execute if score VERSION$minecraft.current.minor DatapackManager matches 21.. if block ~ ~ ~ #minecraft:doors[powered=false] run function dimensionaldoors:root/closermechanism/v1

# cleanup
tag @s remove DD_close
scoreboard players reset @s DimensionalDoors