#> -----------------------------------------------
#> Vanilla Essentials Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> uninstall
# this code actually uninstalls vanillaessentials


# set version
scoreboard players reset $ve.version TP_version
scoreboard players reset $ve.api TP_version

# uninstall msg
tellraw @a [{"text":""},{"text":" -","color":"red"},{"text":" [Vanilla Essentials] ","color":"aqua"},{"text":"uninstalled successfully","color":"gray"}]

# remove all persistent entities
kill @e[tag=VanillaEssentials]


# core triggers
scoreboard objectives remove stats
scoreboard objectives remove playtime
scoreboard objectives remove uptime
scoreboard objectives remove pathspeed

# stats
scoreboard objectives remove VE_Health
scoreboard objectives remove VE_DeathCount
#scoreboard objectives remove VE_Air
#scoreboard objectives remove VE_Food
#scoreboard objectives remove VE_Armor
#scoreboard objectives remove VE_Exp
#scoreboard objectives remove VE_Level

scoreboard objectives remove VE_PathSpeed

#scoreboard objectives remove VE_SleepInBed

scoreboard objectives remove VE_Stats
team remove VE_Stats


# disable pack
datapack disable "file/vanillaessentials"


#> End of file
#> -----------
