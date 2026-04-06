#> -----------------------------------------------
#> Vanilla Essentials Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> detection
# figure out if players are in beds


execute as @a[scores={VE_SleepInBed=1..}] at @s if block ~ ~ ~ #minecraft:beds run tag @s add VE_isSleeping

execute as @a[tag=VE_isSleeping] at @s unless block ~ ~ ~ #minecraft:beds run tag @s remove VE_isSleeping

execute as @a[scores={VE_SleepInBed=1..}] run scoreboard players reset @s VE_SleepInBed



#> End of file
#> -----------
