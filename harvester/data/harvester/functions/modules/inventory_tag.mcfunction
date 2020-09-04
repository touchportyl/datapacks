#> -----------------------------------------------
#> Harvester Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> inventory tag
# this code assigns tags based on the player's inventory items


execute if entity @s[nbt={Inventory:[{id:"minecraft:wheat_seeds"}]}] run tag @s add H_wheat
execute if entity @s[nbt={Inventory:[{id:"minecraft:potato"}]}] run tag @s add H_potato
execute if entity @s[nbt={Inventory:[{id:"minecraft:carrot"}]}] run tag @s add H_carrot
execute if entity @s[nbt={Inventory:[{id:"minecraft:beetroot_seeds"}]}] run tag @s add H_beetroot


#> End of file
#> -----------
