tellraw @a[tag=dm_debug] [{"text":"DM","color":"white"},{"text":" > packages/slowupdates/functions/clearschedules.mcfunction","color":"gray"}]

# stop loops
scoreboard players operation LOOP$tickers.1s.isLooping DatapackManager = BOOL$false DatapackManager

scoreboard players operation FLAG$dirty DatapackManager = BOOL$true DatapackManager