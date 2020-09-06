#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> controller (references: ../modules/enchants/riptide)
# this code controls the riptide item's effects


# start timer
scoreboard players add @s TC_RiptideTimer 1

#pfx:crit
particle minecraft:crit ~ ~0.5 ~ 0.5 0.4 0.5 0.1 2 force

# timeline
execute as @s[scores={TC_RiptideTimer=1}] at @s run effect give @s minecraft:levitation 2 3 true

execute as @s[scores={TC_RiptideTimer=10}] at @s run playsound minecraft:entity.player.attack.sweep block @a ~ ~ ~ 0.7 1.6 0
execute as @s[scores={TC_RiptideTimer=15}] at @s run playsound minecraft:entity.player.attack.sweep block @a ~ ~ ~ 0.7 1.6 0
execute as @s[scores={TC_RiptideTimer=20}] at @s run playsound minecraft:entity.player.attack.sweep block @a ~ ~ ~ 0.7 1.6 0
execute as @s[scores={TC_RiptideTimer=25}] at @s run playsound minecraft:entity.player.attack.sweep block @a ~ ~ ~ 0.7 1.6 0
execute as @s[scores={TC_RiptideTimer=35}] at @s run playsound minecraft:entity.player.attack.sweep block @a ~ ~ ~ 0.7 1.6 0

execute as @s[scores={TC_RiptideTimer=35..}] at @s run particle minecraft:explosion ~ ~ ~ 0 0 0 0 1 force
execute as @s[scores={TC_RiptideTimer=35..}] at @s run playsound minecraft:entity.generic.explode block @a ~ ~ ~ 1 2 0

function tinkererscraft:packages/loot_doubler

execute as @s[scores={TC_RiptideTimer=35..}] at @s run kill @s


#> End of file
#> -----------
