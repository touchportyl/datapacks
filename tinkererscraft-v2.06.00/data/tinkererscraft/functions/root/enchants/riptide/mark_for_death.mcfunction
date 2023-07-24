# marks entities for death by riptide
#
# list of entities that cannot be marked for death
# - player
# - area_effect_cloud
# - armor_stand
# - item_frame
# - wither
# - ender_dragon
# - elder_guardian
# - evoker
# - enderman
# - shulker
# - giant


# mark for death
execute if score RAND$6 TinkerersCraft matches 1 as @s at @s run tag @e[type=!minecraft:player,type=!minecraft:area_effect_cloud,type=!minecraft:armor_stand,type=!minecraft:item_frame,type=!minecraft:wither,type=!minecraft:ender_dragon,type=!minecraft:elder_guardian,type=!minecraft:evoker,type=!minecraft:enderman,type=!minecraft:shulker,type=!minecraft:giant,tag=!TC_markedfordeath,tag=!TC_markedfordeath_,distance=..15,sort=random,limit=1] add TC_markedfordeath

execute if score RAND$6 TinkerersCraft matches 2.. as @s at @s run tag @e[type=!minecraft:player,type=!minecraft:area_effect_cloud,type=!minecraft:armor_stand,type=!minecraft:item_frame,type=!minecraft:wither,type=!minecraft:ender_dragon,type=!minecraft:elder_guardian,type=!minecraft:evoker,type=!minecraft:enderman,type=!minecraft:shulker,type=!minecraft:giant,tag=!TC_markedfordeath,tag=!TC_markedfordeath_,distance=..15,sort=random,limit=1] add TC_markedfordeath_