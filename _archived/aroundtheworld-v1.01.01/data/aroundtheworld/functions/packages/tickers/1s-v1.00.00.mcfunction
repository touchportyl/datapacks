# run code every second
function aroundtheworld:root/boundsdetection

# tick updates
execute if score FLAG$dirty AroundTheWorld = BOOL$true DatapackManager run function aroundtheworld:packages/slowupdates/update

# tick
execute unless score LOOP$tickers.1s.isLooping AroundTheWorld = BOOL$false DatapackManager run schedule function aroundtheworld:packages/tickers/1s-v1.00.00 1s