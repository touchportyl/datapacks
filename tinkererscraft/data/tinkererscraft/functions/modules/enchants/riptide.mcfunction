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

# hurt detector
execute as @e[type=!minecraft:player,type=!minecraft:armor_stand,type=!minecraft:wither,type=!minecraft:ender_dragon,type=!minecraft:elder_guardian,type=!minecraft:evoker,type=!minecraft:enderman,type=!minecraft:shulker,type=!minecraft:giant,tag=!TC_hurt,nbt={HurtTime:10s}] at @s run tag @s add TC_hurt

#> randomizer
scoreboard players add @e[tag=TC_hurt] TC_rand_20 1
scoreboard players set @e[tag=TC_hurt,scores={TC_rand_20=20..}] TC_rand_20 1

# activate riptide
execute as @e[tag=TC_holdRiptide] at @s run tag @e[tag=TC_hurt,scores={TC_rand_20=4},distance=..4] add TC_rip

#> controller
execute as @e[tag=TC_rip] at @s run function tinkererscraft:modules/enchants/riptide/controller

#todo:gc
execute as @e[tag=TC_hurt] at @s run tag @s remove TC_hurt
execute as @e[tag=TC_holdRiptide] at @s run tag @s remove TC_holdRiptide


#> End of file
#> -----------
