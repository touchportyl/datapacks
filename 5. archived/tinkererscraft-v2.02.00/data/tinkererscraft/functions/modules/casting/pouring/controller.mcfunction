#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> controller (references: ../main)
# this code handles the smeltery's pouring mechanics


# timer++ when pouring
scoreboard players add @s TC_OutputTimer 1


#> conditions
execute as @s[scores={TC_OutputTimer=1..}] run function tinkererscraft:modules/casting/pouring/conditions


# reset to remove from ui
execute as @s[tag=TC_outputcopper,scores={TC_lCopper=-1}] run scoreboard players reset @s TC_lCopper
execute as @s[tag=TC_outputiron,scores={TC_lIron=-1}] run scoreboard players reset @s TC_lIron
execute as @s[tag=TC_outputgold,scores={TC_lGold=-1}] run scoreboard players reset @s TC_lGold
execute as @s[tag=TC_outputobsidian,scores={TC_lObsidian=-1}] run scoreboard players reset @s TC_lObsidian
execute as @s[tag=TC_outputirgol,scores={TC_lIrgol=-1}] run scoreboard players reset @s TC_lIrgol
execute as @s[tag=TC_outputobdiam,scores={TC_lObdiam=-1}] run scoreboard players reset @s TC_lObdiam

#> start
execute as @s[scores={TC_OutputTimer=2}] at @s run function tinkererscraft:modules/effects/pouring/start

#> cauldron
execute as @s[tag=TC_cauldron] at @s run function tinkererscraft:modules/effects/pouring/cauldron

#> anvil
execute as @s[tag=TC_anvil] at @s run function tinkererscraft:modules/effects/pouring/anvil


#> drain > custom_items
function tinkererscraft:modules/casting/drain


# update ui
function tinkererscraft:modules/smeltery/ui/update


#> End of file
#> -----------
