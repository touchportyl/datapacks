# tag if the door doesn't exist
execute as @e[tag=DD_portal] at @s unless block ~ ~ ~ #minecraft:doors run tag @s add DD_destroy

# tag any corresponding doors that are linked to doors queued for destruction
# every queued door is matched on its own, so two linked pairs broken in the same tick are both removed
# no distance or sort argument is used, because either would limit the search to the same dimension
execute as @e[tag=DD_destroy] run function dimensionaldoors:root/destroy/partners

# handle destruction
execute as @e[tag=DD_destroy] at @s run function dimensionaldoors:root/destroy/handler
