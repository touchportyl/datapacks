#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> mark_for_death (references: ../root/enchants/riptide)
# this code marks entities for death by riptide
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


#> randomizer
scoreboard players add @s TC_rand_6 1
scoreboard players set @s[scores={TC_rand_6=6..}] TC_rand_6 1

# mark for death
execute as @s[scores={TC_rand_6=1}] at @s run tag @e[type=!minecraft:player,type=!minecraft:area_effect_cloud,type=!minecraft:armor_stand,type=!minecraft:item_frame,type=!minecraft:wither,type=!minecraft:ender_dragon,type=!minecraft:elder_guardian,type=!minecraft:evoker,type=!minecraft:enderman,type=!minecraft:shulker,type=!minecraft:giant,tag=!TC_markedfordeath,tag=!TC_markedfordeath_,distance=..15,sort=random,limit=1] add TC_markedfordeath
execute as @s[scores={TC_rand_6=2..}] at @s run tag @e[type=!minecraft:player,type=!minecraft:area_effect_cloud,type=!minecraft:armor_stand,type=!minecraft:item_frame,type=!minecraft:wither,type=!minecraft:ender_dragon,type=!minecraft:elder_guardian,type=!minecraft:evoker,type=!minecraft:enderman,type=!minecraft:shulker,type=!minecraft:giant,tag=!TC_markedfordeath,tag=!TC_markedfordeath_,distance=..15,sort=random,limit=1] add TC_markedfordeath_