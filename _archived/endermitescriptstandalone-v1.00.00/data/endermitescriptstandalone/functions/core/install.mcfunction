tellraw @a[tag=developer] {"text":""}
tellraw @a[tag=developer] [{"text":"","color":"gray"},{"text":"This server is running "},{"text":"Endermite Script Standalone v1.00.00","color":"white","underlined":true},{"text":" by "},{"text":"touchportyl","color":"light_purple"}]

# clear schedules
#schedule clear endermitescriptstandalone:core/tick
schedule clear endermitescriptstandalone:endermitescript/tick


# start tickers
schedule function endermitescriptstandalone:core/loops/blinkingredstonelamp-unlit 1s


# start tick
#schedule function endermitescriptstandalone:core/tick 1s

# start endermite script
schedule function endermitescriptstandalone:endermitescript/tick 1s