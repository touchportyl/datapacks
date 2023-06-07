#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> check anvil (references: ../modules/casting/output/check)
# this code sorts the anvil setup in front of the smeltery into the appropriate tags for the next segment of code


# anvil specific detection
execute as @s at @s positioned ^ ^ ^2 if entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:clay_ball",Count:1b}}] run tag @s add TC_nugget
execute as @s at @s positioned ^ ^ ^2 if entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:brick",Count:1b}}] run tag @s add TC_ingot

execute as @s at @s positioned ^ ^ ^2 if entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_pickaxe",Count:1b}}] run tag @s add TC_pickaxe
execute as @s at @s positioned ^ ^ ^2 if entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_sword",Count:1b}}] run tag @s add TC_sword
execute as @s at @s positioned ^ ^ ^2 if entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_axe",Count:1b}}] run tag @s add TC_axe
execute as @s at @s positioned ^ ^ ^2 if entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_shovel",Count:1b}}] run tag @s add TC_shovel
execute as @s at @s positioned ^ ^ ^2 if entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_hoe",Count:1b}}] run tag @s add TC_hoe

execute as @s[tag=!TC_nugget,tag=!TC_ingot,tag=!TC_pickaxe,tag=!TC_sword,tag=!TC_axe,tag=!TC_shovel,tag=!TC_hoe] at @s positioned ^ ^ ^2 if entity @e[type=minecraft:item_frame,distance=..0.2] run tag @s add TC_pressureplate


#> End of file
#> -----------
