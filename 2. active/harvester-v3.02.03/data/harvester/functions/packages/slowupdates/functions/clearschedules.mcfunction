tellraw @a[tag=hv_debug] [{"text":"HV","color":"gold"},{"text":" > packages/slowupdates/functions/clearschedules.mcfunction","color":"gray"}]

# stop loops
scoreboard players operation LOOP$tickers.2t.isLooping Harvester = BOOL$false DatapackManager
scoreboard players operation LOOP$tickers.1s.isLooping Harvester = BOOL$false DatapackManager

scoreboard players operation FLAG$dirty DatapackManager = BOOL$true DatapackManager