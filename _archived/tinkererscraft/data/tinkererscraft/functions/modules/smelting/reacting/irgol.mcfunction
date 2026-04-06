#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> irgol (references: ../main)
# this code turns items into scoreboard values


# irgol
scoreboard players remove @s TC_lIron 2
scoreboard players remove @s TC_lGold 3
scoreboard players add @s TC_lIrgol 1

# reaction effects
playsound minecraft:block.brewing_stand.brew block @a ~ ~ ~ 0.5 2 0
particle minecraft:effect ~ ~2.5 ~ 0.2 0.1 0.2 0 10 force

# advancement on reaction
execute as @s at @s as @e[type=player,distance=..7,sort=nearest] run advancement grant @s until tinkererscraft:smelting/reacting/irgol

#todo:gc
tag @s remove TC_irgolreaction

# display shows recently smelted
function tinkererscraft:modules/smeltery/ui/override/irgol


#> End of file
#> -----------
