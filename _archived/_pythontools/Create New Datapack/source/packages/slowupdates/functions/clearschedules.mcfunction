tellraw @a[tag=$datapackID_lower_debug] [{"text":"$datapackID","color":"$datapackColor"},{"text":" > packages/slowupdates/functions/clearschedules.mcfunction","color":"gray"}]

# stop loops
scoreboard players operation LOOP$tickers.1t.isLooping $datapackFullName = BOOL$false DatapackManager
scoreboard players operation LOOP$tickers.1s.isLooping $datapackFullName = BOOL$false DatapackManager

scoreboard players operation FLAG$dirty DatapackManager = BOOL$true DatapackManager