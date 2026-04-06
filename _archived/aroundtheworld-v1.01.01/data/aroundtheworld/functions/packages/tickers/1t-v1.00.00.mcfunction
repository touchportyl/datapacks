# run code every tick (20 times a second)
#function aroundtheworld:yourfunction

# tick
execute unless score LOOP$tickers.1t.isLooping AroundTheWorld = BOOL$false DatapackManager run schedule function aroundtheworld:packages/tickers/1t-v1.00.00 1t
