# run code every second

function tinkererscraft:root/main-1s


# tick updates
execute if score FLAG$dirty TinkerersCraft = BOOL$true DatapackManager run function tinkererscraft:packages/slowupdates/update

# tick
execute unless score LOOP$tickers.1s.isLooping TinkerersCraft = BOOL$false DatapackManager run schedule function tinkererscraft:packages/tickers/1s-v2.06.00 1s