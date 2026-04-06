# run code every 5 ticks (4 times a second)

function tinkererscraft:root/main-5t



# tick
execute unless score LOOP$tickers.5t.isLooping TinkerersCraft = BOOL$false DatapackManager run schedule function tinkererscraft:packages/tickers/5t-v2.06.00 5t