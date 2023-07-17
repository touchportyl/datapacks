#> -----------------------------------------------
#> Tinkerer's Craft v2.0
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> ----------
#> initialize

# init
scoreboard objectives remove TC_init
scoreboard objectives add TC_init dummy [{"text":"Initialize Checker for Tinkerer's Craft","color":"gold"}]

# api hook
scoreboard objectives add TC_api dummy [{"text":"API Hook for Plugins","color":"gold"}]
scoreboard players set TC_api_hash TC_api 101

# how to read the api hash
# <api version 10-99> <is api enabled 0-1>
# eg:
# version 3.5 & api on
# TC_api_hash = 351

#> --------------
#> core variables

scoreboard objectives add TP_Timer dummy [{"text":"Global Timer","color":"white"}]
scoreboard objectives add give trigger [{"text":"Global Item Giver","color":"white"}]

#> -----------
#> randomizers

# 1-20
scoreboard objectives add TC_rand_20 dummy [{"text":"Randomizer (20) for Tinkerer's Craft","color":"gold"}]

#> minecraft.broken
# pickaxe: cobblestone iron_ore gold_ore
# axe: log
# shovel: sand clay
#scoreboard objectives add TC_dCobble minecraft.broken:minecraft.cobblestone [{"text":"Cobblestone Broken for Tinkerer's Craft","color":"gold"}]
#scoreboard objectives add TC_dIronOre minecraft.broken:
#scoreboard objectives add TC_dGoldOre minecraft.broken:

#scoreboard objectives add TC_dLog1 minecraft.broken:

#scoreboard objectives add TC_dSand minecraft.broken:
#scoreboard objectives add TC_dClay minecraft.broken:

#> ----------
#> objectives

# scoreboard name limit  ----------------
#########################

# timers
scoreboard objectives add TC_OutputTimer dummy [{"text":"Output Timer","color":"gold"}]
scoreboard objectives add TC_SmeltingTimer dummy [{"text":"Smelting Timer","color":"gold"}]
scoreboard objectives add TC_FlamingTimer dummy [{"text":"Flaming Particle Timer","color":"gold"}]
scoreboard objectives add TC_ShinyTimer dummy [{"text":"Shiny Particle Timer","color":"gold"}]
scoreboard objectives add TC_LungeTimer minecraft.custom:minecraft.sneak_time [{"text":"Lunge Sneak Time","color":"gold"}]
scoreboard objectives add TC_RiptideTimer dummy [{"text":"Riptide Timer","color":"gold"}]

# calculation buffers
scoreboard objectives add TC_bIronOre dummy [{"text":"Iron Ore Buffer","color":"gold"}]
scoreboard objectives add TC_bGoldOre dummy [{"text":"Gold Ore Buffer","color":"gold"}]
scoreboard objectives add TC_bIron dummy [{"text":"Iron Buffer","color":"gold"}]
scoreboard objectives add TC_bGold dummy [{"text":"Gold Buffer","color":"gold"}]
scoreboard objectives add TC_bIronBlock dummy [{"text":"Iron Block Buffer","color":"gold"}]
scoreboard objectives add TC_bGoldBlock dummy [{"text":"Gold Block Buffer","color":"gold"}]
scoreboard objectives add TC_bObsidian dummy [{"text":"Obsidian Buffer","color":"gold"}]

# storage
scoreboard objectives add TC_lIron dummy [{"text":"Amount of Liquid Iron stored","color":"gold"}]
scoreboard objectives add TC_lGold dummy [{"text":"Amount of Liquid Gold stored","color":"gold"}]
scoreboard objectives add TC_lObsidian dummy [{"text":"Amount of Liquid Obsidian stored","color":"gold"}]
scoreboard objectives add TC_lIrgol dummy [{"text":"Amount of Liquid Irgol stored","color":"gold"}]
scoreboard objectives add TC_lObdiam dummy [{"text":"Amount of Liquid Obdiam stored","color":"gold"}]

# hardcoded arrays
scoreboard objectives add TC_NumberArray dummy [{"text":"Numerical Array for TC","color":"gold"}]
scoreboard players set One TC_NumberArray 1
scoreboard players set Two TC_NumberArray 2
scoreboard players set Three TC_NumberArray 3
scoreboard players set Four TC_NumberArray 4
scoreboard players set Five TC_NumberArray 5
scoreboard players set Six TC_NumberArray 6
scoreboard players set Seven TC_NumberArray 7
scoreboard players set Eight TC_NumberArray 8
scoreboard players set Nine TC_NumberArray 9
scoreboard players set Ten TC_NumberArray 10


#> ---------------
#> loading message

tellraw @a [{"text":""},{"text":"   ➥","color":"red","hoverEvent":{"action":"show_text","value":"Created by touchportal!"}},{"text":" Loading"},{"text":" [Tinkerer's Craft] ","color":"aqua","hoverEvent":{"action":"show_text","value":"As if the nether update wasn't enough."}},{"text":"v2.0"}]


#> End of file
#> -----------
