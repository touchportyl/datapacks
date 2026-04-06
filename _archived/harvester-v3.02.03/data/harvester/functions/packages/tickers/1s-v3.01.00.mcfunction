# run code every second
#function harvester:yourfunction

# tick updates
execute if score FLAG$dirty Harvester = BOOL$true DatapackManager run function harvester:packages/slowupdates/update

# tick
execute unless score LOOP$tickers.1s.isLooping Harvester = BOOL$false DatapackManager run schedule function harvester:packages/tickers/1s-v3.01.00 1s