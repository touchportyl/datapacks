#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> uninstall
# this code is for quick uninstalling

tellraw @s [{"text":""},{"text":"\n - "},{"text":"Uninstall Tinkerer's Craft","color":"green","clickEvent":{"action":"run_command","value":"/function tinkererscraft:packages/uninstall"}},{"text":"\n"}]

scoreboard players reset @s uninstall


#> End of file
#> -----------
