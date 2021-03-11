#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> tests
# this code is for quick testing

tellraw @s [{"text":""},{"text":"\n - "},{"text":"Run Tinkerer's Craft Versioning Test","color":"green","clickEvent":{"action":"run_command","value":"/function tinkererscraft:packages/tests/versioning/run"}}]
tellraw @s [{"text":""},{"text":" - "},{"text":"Run Tinkerer's Craft Smelting Test","color":"green","clickEvent":{"action":"run_command","value":"/function tinkererscraft:packages/tests/smelting/run"}},{"text":"\n"}]

scoreboard players reset @s tests


#> End of file
#> -----------
