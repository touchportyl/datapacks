# tag destroy
execute as @e[tag=DD_portal] at @s unless block ~ ~ ~ minecraft:oak_door run tag @s add DD_destroy

# remove loaders
execute as @e[tag=DD_destroy] at @s run forceload remove ~ ~

# hard check if it's supposed to be loaded
execute as @e[tag=DD_destroy] at @s at @e[tag=DD_portal,tag=!DD_destroy,distance=..32] run forceload add ~ ~

# blow up all with same ID
# CONFIG: can be disabled
execute if score CONFIG$destroyexplosively DimensionalDoors = BOOL$true DatapackManager as @e[tag=DD_portal] at @s align xyz if score @s DD_doorID = @e[tag=DD_destroy,distance=0.5..,limit=1] DD_doorID run summon minecraft:fireball ~0.5 ~0.5 ~0.5 {Motion:[0.0,-10.0,0.0],ExplosionPower:2,ExplosionRadius:2}
# non-damaging variant
execute if score CONFIG$destroyexplosively DimensionalDoors = BOOL$false DatapackManager as @e[tag=DD_portal] at @s align xyz positioned ~0.5 ~0.5 ~0.5 if score @s DD_doorID = @e[tag=DD_destroy,distance=0.5..,limit=1] DD_doorID run function dimensionaldoors:modules/nondestructiveexplosion-3.00.00

# kill tag
execute as @e[tag=DD_destroy] run kill @s
