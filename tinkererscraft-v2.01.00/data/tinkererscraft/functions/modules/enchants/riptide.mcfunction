#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> riptide (references: ../main)
# this is code for the riptide enchant


# tag
tag @e[nbt={SelectedItem:{tag:{TC_Riptide:1b}}}] add TC_holdRiptide

#> mark_for_death
execute as @e[tag=TC_holdRiptide] run function tinkererscraft:modules/enchants/riptide/mark_for_death

# show marked entities
execute as @e[tag=TC_markedfordeath] at @s if entity @a[tag=TC_holdRiptide,distance=..10] run effect give @s minecraft:glowing 1 0 true

# hurt detector
execute as @e[type=!minecraft:player,type=!minecraft:armor_stand,type=!minecraft:wither,type=!minecraft:ender_dragon,type=!minecraft:elder_guardian,type=!minecraft:evoker,type=!minecraft:enderman,type=!minecraft:shulker,type=!minecraft:giant,tag=!TC_hurt,nbt={HurtTime:10s}] at @s run tag @s add TC_hurt

# activate riptide
execute as @e[tag=TC_holdRiptide] at @s run tag @e[tag=TC_markedfordeath,tag=TC_hurt,distance=..4.2] add TC_rip

#> controller
execute as @e[tag=TC_rip] at @s run function tinkererscraft:modules/enchants/riptide/controller

#todo:gc
execute as @e[tag=TC_hurt] at @s run tag @s remove TC_hurt
execute as @e[tag=TC_holdRiptide] at @s run tag @s remove TC_holdRiptide


#> End of file
#> -----------
