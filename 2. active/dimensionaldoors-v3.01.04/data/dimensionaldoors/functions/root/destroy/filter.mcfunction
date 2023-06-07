# tag if the door doesn't exist
execute as @e[tag=DD_portal] at @s unless block ~ ~ ~ minecraft:oak_door run tag @s add DD_destroy


# tag any corresponding doors that are linked to doors queued for destruction
# don't use `distance=0.5..` because it limits the search to the same dimension
# use `sort=furthest` instead
execute as @e[tag=DD_portal] at @s if score @s DD_doorID = @e[tag=DD_destroy,sort=furthest,limit=1] DD_doorID run tag @s add DD_destroy


# handle destruction
execute as @e[tag=DD_destroy] at @s run function dimensionaldoors:root/destroy/handler