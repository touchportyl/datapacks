tellraw @a[tag=tc_debug] [{"text":"TC","color":"gold"},{"text":" > installer-v2.06.00.mcfunction","color":"gray"}]

# set secret
scoreboard players operation FLAG$secret TinkerersCraft = FLAG$secret DatapackManager



# write your installation code here

#> create scoreboards

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
scoreboard objectives add TC_lCapacity dummy [{"text":"Storage Capacity","color":"gold"}]
scoreboard objectives add TC_lIron dummy [{"text":"Amount of Liquid Iron stored","color":"gold"}]
scoreboard objectives add TC_lGold dummy [{"text":"Amount of Liquid Gold stored","color":"gold"}]
scoreboard objectives add TC_lObsidian dummy [{"text":"Amount of Liquid Obsidian stored","color":"gold"}]
scoreboard objectives add TC_lIrgol dummy [{"text":"Amount of Liquid Irgol stored","color":"gold"}]
scoreboard objectives add TC_lObdiam dummy [{"text":"Amount of Liquid Obdiam stored","color":"gold"}]

#> create bossbars
#> set variables



# notify
scoreboard players operation ALERT$installed TinkerersCraft = BOOL$true DatapackManager
scoreboard players operation FLAG$dirty TinkerersCraft = BOOL$true DatapackManager