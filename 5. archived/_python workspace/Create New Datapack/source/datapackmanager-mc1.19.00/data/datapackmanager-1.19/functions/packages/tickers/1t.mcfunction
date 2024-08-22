# tick tag
# compatibility for 1.13

execute if score FLAG$dirty DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.19:packages/slowupdates/update

# load all tickers here
execute if score LOOP$tickers.1s.isLooping DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.19:packages/tickers/1s