execute if score FLAG$dirty DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.19:packages/slowupdates/update

scoreboard players operation FLAG$noschedulecommand DatapackManager = BOOL$false DatapackManager

# tick
execute unless score LOOP$tickers.1s.isLooping DatapackManager = BOOL$false DatapackManager run schedule function datapackmanager-1.19:packages/tickers/1s 1s