# run code every 1 tick (20 times a second)

function tinkererscraft:root/main-1t


# tick
execute unless score LOOP$tickers.1t.isLooping TinkerersCraft = BOOL$false DatapackManager run schedule function tinkererscraft:packages/tickers/1t-v2.06.00 1t