# run code every tick (20 times a second)
#function $datapackFullName_lower:yourfunction

# tick
execute unless score LOOP$tickers.1t.isLooping $datapackFullName = BOOL$false DatapackManager run schedule function $datapackFullName_lower:packages/tickers/1t-$datapackDisplayVersion 1t
