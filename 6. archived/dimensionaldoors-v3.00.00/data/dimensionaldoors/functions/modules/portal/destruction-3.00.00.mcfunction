# tag if the door doesn't exist
execute as @e[tag=DD_portal] at @s unless block ~ ~ ~ minecraft:oak_door run tag @s add DD_destroy

# tag any corresponding doors that are linked to doors queued for destruction
execute as @e[tag=DD_portal] if score @s DD_doorID = @e[tag=DD_destroy,distance=0.5..,limit=1] DD_doorID run tag @s add DD_destroy


# blow up all with same ID
# CONFIG: can be disabled
execute if score CONFIG$destroyexplosively DimensionalDoors = BOOL$true DatapackManager as @e[tag=DD_destroy] at @s align xyz positioned ~0.5 ~0.5 ~0.5 run function dimensionaldoors:modules/effects/destructiveexplosion-3.00.00
# non-damaging variant
execute if score CONFIG$destroyexplosively DimensionalDoors = BOOL$false DatapackManager as @e[tag=DD_destroy] at @s align xyz positioned ~0.5 ~0.5 ~0.5 run function dimensionaldoors:modules/effects/nondestructiveexplosion-3.00.00


# remove loaders
execute as @e[tag=DD_destroy] at @s run forceload remove ~ ~

# hard check if it's supposed to be loaded
execute as @e[tag=DD_destroy] at @s at @e[tag=DD_portal,tag=!DD_destroy,distance=..32] run forceload add ~ ~


# kill tag
execute as @e[tag=DD_destroy] run kill @s
