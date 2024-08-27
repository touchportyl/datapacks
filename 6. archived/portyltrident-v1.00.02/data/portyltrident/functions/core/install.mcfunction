tellraw @a[tag=developer] {"text":""}
tellraw @a[tag=developer] [{"text":"","color":"gray"},{"text":"> "},{"text":"Portyl Trident","color":"white","underlined":true},{"text":" by "},{"text":"touchportyl","color":"light_purple"}]

# clear schedules
schedule clear portyltrident:core/tick

# scoreboards
scoreboard objectives add PortylTrident dummy

# start tick
schedule function portyltrident:core/tick 1s