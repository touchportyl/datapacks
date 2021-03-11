#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> listen
# listen for the common triggers

scoreboard players enable @a uninstall
execute as @a[scores={uninstall=1..}] run function tinkererscraft:packages/hooks/uninstall

scoreboard players enable @a tests
execute as @a[scores={tests=1..}] run function tinkererscraft:packages/hooks/tests

#> End of file
#> -----------
