#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> enchants lunge
# this code controls the timeline for the lunge skill


execute as @s[scores={TC_LungeTimer=5}] at @s run function tinkererscraft:modules/enchants/lunge/status_1
execute as @s[scores={TC_LungeTimer=20}] at @s run function tinkererscraft:modules/enchants/lunge/status_2
execute as @s[scores={TC_LungeTimer=35}] at @s run playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 0.5 1.4 0
execute as @s[scores={TC_LungeTimer=35..}] at @s run function tinkererscraft:modules/enchants/lunge/status_3
execute as @e[scores={TC_LungeTimer=36..}] at @s if predicate tinkererscraft:player_checkers/is_sneaking_ run function tinkererscraft:modules/effects/effects_heated
execute as @e[scores={TC_LungeTimer=36..40}] at @s if predicate tinkererscraft:player_checkers/is_sneaking_ run function tinkererscraft:modules/enchants/lunge/skill_tech



#> End of file
#> -----------
