#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> copper (references: ../modules/smelting/smelt)
# this code turns items into scoreboard values


# ore
execute as @s at @s store result score @s TC_bCopper run data get entity @e[tag=TC_copperore,distance=..2,sort=nearest,limit=1] Item.Count
execute as @s at @s run function tinkererscraft:modules/smelting/process/push

# ingot
execute as @s at @s store result score @s TC_bCopper run data get entity @e[tag=TC_copper,distance=..2,sort=nearest,limit=1] Item.Count
execute as @s at @s run function tinkererscraft:modules/smelting/process/push

# block
# crafted using 4 ingots to make 1 block
execute as @s at @s store result score @s TC_bCopper run data get entity @e[tag=TC_copperblock,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bCopper=1..}] TC_bCopper *= Four TC_NumberArray
execute as @s at @s run function tinkererscraft:modules/smelting/process/push
execute as @s at @s store result score @s TC_bCopper run data get entity @e[tag=TC_exposedcopperblock,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bCopper=1..}] TC_bCopper *= Three TC_NumberArray
execute as @s at @s run function tinkererscraft:modules/smelting/process/push
execute as @s at @s store result score @s TC_bCopper run data get entity @e[tag=TC_weatheredcopperblock,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bCopper=1..}] TC_bCopper *= Three TC_NumberArray
execute as @s at @s run function tinkererscraft:modules/smelting/process/push
execute as @s at @s store result score @s TC_bCopper run data get entity @e[tag=TC_oxidisedcopperblock,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bCopper=1..}] TC_bCopper *= Two TC_NumberArray
execute as @s at @s run function tinkererscraft:modules/smelting/process/push

# cut copper
# crafted using 4 blocks to make 1 block
# or using stonecutter to create a block from a block
execute as @s at @s store result score @s TC_bCopper run data get entity @e[tag=TC_cutcopper,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bCopper=1..}] TC_bCopper *= Three TC_NumberArray
execute as @s at @s run function tinkererscraft:modules/smelting/process/push
execute as @s at @s store result score @s TC_bCopper run data get entity @e[tag=TC_exposedcutcopper,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bCopper=1..}] TC_bCopper *= Three TC_NumberArray
execute as @s at @s run function tinkererscraft:modules/smelting/process/push
execute as @s at @s store result score @s TC_bCopper run data get entity @e[tag=TC_weatheredcutcopper,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bCopper=1..}] TC_bCopper *= Two TC_NumberArray
execute as @s at @s run function tinkererscraft:modules/smelting/process/push
execute as @s at @s store result score @s TC_bCopper run data get entity @e[tag=TC_oxidisedcutcopper,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bCopper=1..}] TC_bCopper *= Two TC_NumberArray
execute as @s at @s run function tinkererscraft:modules/smelting/process/push

# copper stairs
execute as @s at @s store result score @s TC_bCopper run data get entity @e[tag=TC_cutcopperstairs,distance=..2,sort=nearest,limit=1] Item.Count
execute as @s at @s run function tinkererscraft:modules/smelting/process/push
#execute as @s at @s store result score @s TC_bCopper run data get entity @e[tag=TC_exposedcutcopperstairs,distance=..2,sort=nearest,limit=1] Item.Count
#execute as @s at @s run function tinkererscraft:modules/smelting/process/push
#execute as @s at @s store result score @s TC_bCopper run data get entity @e[tag=TC_weatheredcutcopperstairs,distance=..2,sort=nearest,limit=1] Item.Count
#execute as @s at @s run function tinkererscraft:modules/smelting/process/push
#execute as @s at @s store result score @s TC_bCopper run data get entity @e[tag=TC_oxidisedcutcopperstairs,distance=..2,sort=nearest,limit=1] Item.Count
#execute as @s at @s run function tinkererscraft:modules/smelting/process/push

# copper slab
execute as @s at @s store result score @s TC_bCopper run data get entity @e[tag=TC_cutcopperslab,distance=..2,sort=nearest,limit=1] Item.Count
execute as @s at @s run function tinkererscraft:modules/smelting/process/push
#execute as @s at @s store result score @s TC_bCopper run data get entity @e[tag=TC_exposedcutcopperslab,distance=..2,sort=nearest,limit=1] Item.Count
#execute as @s at @s run function tinkererscraft:modules/smelting/process/push
#execute as @s at @s store result score @s TC_bCopper run data get entity @e[tag=TC_weatheredcutcopperslab,distance=..2,sort=nearest,limit=1] Item.Count
#execute as @s at @s run function tinkererscraft:modules/smelting/process/push
#execute as @s at @s store result score @s TC_bCopper run data get entity @e[tag=TC_oxidisedcutcopperslab,distance=..2,sort=nearest,limit=1] Item.Count
#execute as @s at @s run function tinkererscraft:modules/smelting/process/push


#> End of file
#> -----------
