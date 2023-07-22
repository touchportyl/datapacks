# run code every 2 ticks (10 times a second)

function tinkererscraft:root/main-2t


# simple "not so random-iser"
# r6
scoreboard players add RAND$6 TinkerersCraft 1
execute if score RAND$6 TinkerersCraft matches 6.. run scoreboard players set RAND$6 TinkerersCraft 1

# r20
scoreboard players add RAND$20 TinkerersCraft 1
execute if score RAND$20 TinkerersCraft matches 20.. run scoreboard players set RAND$20 TinkerersCraft 1


# tick
execute unless score LOOP$tickers.2t.isLooping TinkerersCraft = BOOL$false DatapackManager run schedule function tinkererscraft:packages/tickers/2t-v2.06.00 2t