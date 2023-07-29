tellraw @a[tag=tc_debug] [{"text":"TC","color":"gold"},{"text":" > packages/slowupdates/functions/clearschedules.mcfunction","color":"gray"}]

# stop loops
scoreboard players operation LOOP$tickers.1t.isLooping TinkerersCraft = BOOL$false DatapackManager
scoreboard players operation LOOP$tickers.2t.isLooping TinkerersCraft = BOOL$false DatapackManager
scoreboard players operation LOOP$tickers.5t.isLooping TinkerersCraft = BOOL$false DatapackManager
scoreboard players operation LOOP$tickers.1s.isLooping TinkerersCraft = BOOL$false DatapackManager

scoreboard players operation FLAG$dirty DatapackManager = BOOL$true DatapackManager