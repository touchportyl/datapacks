function swiftghasts:stoploops

# remove all modifications made by the datapack
execute as @e[type=minecraft:happy_ghast] run attribute @s minecraft:flying_speed base reset
function swiftghasts:remove_contexts
tag @s remove SG_leashed
tag @e remove SG_log
tag @e remove SwiftGhast
scoreboard objectives remove SwiftGhasts

execute as @a run function swiftghasts:message {"message":"Datapack unloaded!"}