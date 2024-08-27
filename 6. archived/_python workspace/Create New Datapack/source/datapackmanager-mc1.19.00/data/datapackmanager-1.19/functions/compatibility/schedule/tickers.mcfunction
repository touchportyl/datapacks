scoreboard players operation FLAG$noschedulecommand DatapackManager = BOOL$false DatapackManager

# load all tickers here
execute if score LOOP$tickers.1s.isLooping DatapackManager = BOOL$true DatapackManager run schedule function datapackmanager-1.19:packages/tickers/1s 1s