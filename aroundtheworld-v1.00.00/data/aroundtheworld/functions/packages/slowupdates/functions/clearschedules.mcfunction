tellraw @a[tag=aw_debug] [{"text":"AW","color":"blue"},{"text":" > packages/slowupdates/functions/clearschedules.mcfunction","color":"gray"}]

# stop loops
scoreboard players operation LOOP$tickers.1t.isLooping AroundTheWorld = BOOL$false DatapackManager
scoreboard players operation LOOP$tickers.1s.isLooping AroundTheWorld = BOOL$false DatapackManager

scoreboard players operation FLAG$dirty DatapackManager = BOOL$true DatapackManager