tellraw @a[tag=dd_debug] [{"text":"DD","color":"light_purple"},{"text":" > packages/slowupdates/functions/clearschedules.mcfunction","color":"gray"}]

# stop loops
scoreboard players operation LOOP$tickers.1t.isLooping DimensionalDoors = BOOL$false DatapackManager
scoreboard players operation LOOP$tickers.1s.isLooping DimensionalDoors = BOOL$false DatapackManager

scoreboard players operation FLAG$dirty DatapackManager = BOOL$true DatapackManager