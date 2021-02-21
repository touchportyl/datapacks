#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> uninstall
# this code actually uninstalls Tinkerer's Craft


# reset version
scoreboard players reset $tc.version TP_version
scoreboard players reset $tc.api TP_version
scoreboard players reset $api.tc.h TP_version

# uninstall msg
tellraw @a [{"text":""},{"text":" -","color":"red"},{"text":" [Tinkerer's Craft] ","color":"aqua"},{"text":"uninstalled successfully","color":"gray"}]

# remove all persistent entities
kill @e[tag=TinkerersCraft]



# randomizers
# r6
scoreboard objectives remove TC_rand_6
# r20
scoreboard objectives remove TC_rand_20

# timers
scoreboard objectives remove TC_OutputTimer
scoreboard objectives remove TC_SmeltingTimer
scoreboard objectives remove TC_FlamingTimer
scoreboard objectives remove TC_ShinyTimer
scoreboard objectives remove TC_LungeTimer
scoreboard objectives remove TC_RiptideTimer

# calculation buffers
scoreboard objectives remove TC_bIronOre
scoreboard objectives remove TC_bGoldOre
scoreboard objectives remove TC_bIron
scoreboard objectives remove TC_bGold
scoreboard objectives remove TC_bIronBlock
scoreboard objectives remove TC_bGoldBlock
scoreboard objectives remove TC_bObsidian

# storage
scoreboard objectives remove TC_lCapacity
scoreboard objectives remove TC_lIron
scoreboard objectives remove TC_lGold
scoreboard objectives remove TC_lObsidian
scoreboard objectives remove TC_lIrgol
scoreboard objectives remove TC_lObdiam

# hardcoded array
scoreboard objectives remove TC_NumberArray


# disable pack
datapack disable "file/tinkererscraft"


#> End of file
#> -----------
