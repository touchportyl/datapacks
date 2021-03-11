#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> push (references: ../modules/smelting/process/*)
# pushes the buffered value to the storage


scoreboard players operation @s[scores={TC_bCopper=1..}] TC_lCopper += @s TC_bCopper
scoreboard players operation @s[scores={TC_bIron=1..}] TC_lIron += @s TC_bIron
scoreboard players operation @s[scores={TC_bGold=1..}] TC_lGold += @s TC_bGold
scoreboard players operation @s[scores={TC_bObsidian=1..}] TC_lObsidian += @s TC_bObsidian


#> End of file
#> -----------
