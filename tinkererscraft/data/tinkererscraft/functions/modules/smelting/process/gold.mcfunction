#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> gold (references: ../modules/smelting/smelt)
# this code turns items into scoreboard values


# ore
execute as @s at @s store result score @s TC_bGold run data get entity @e[tag=TC_goldore,distance=..2,sort=nearest,limit=1] Item.Count
execute as @s at @s run function tinkererscraft:modules/smelting/process/push
execute as @s at @s store result score @s TC_bGold run data get entity @e[tag=TC_deepslategoldore,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bGold=1..}] TC_bGold *= Two TC_NumberArray
execute as @s at @s run function tinkererscraft:modules/smelting/process/push

# ingot
execute as @s at @s store result score @s TC_bGold run data get entity @e[tag=TC_gold,distance=..2,sort=nearest,limit=1] Item.Count
execute as @s at @s run function tinkererscraft:modules/smelting/process/push

# block
execute as @s at @s store result score @s TC_bGold run data get entity @e[tag=TC_goldblock,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bGold=1..}] TC_bGold *= Nine TC_NumberArray
execute as @s at @s run function tinkererscraft:modules/smelting/process/push


#> End of file
#> -----------
