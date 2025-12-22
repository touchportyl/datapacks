# this script is designed to automatically generate all the chunks in the area provided

# bounds
# min.x  -6400
# max.x   2400
# min.z  -1900
# max.z   2900

# tag the player that runs this
tag @s add AW_generate

# start the player at the min
tp @s -6400 150 -1900 0 90

# init all other values
scoreboard players reset @s AroundTheWorld
scoreboard players set TRACKER$generate.step.x AroundTheWorld 0
scoreboard players set TRACKER$generate.step.z AroundTheWorld 0
scoreboard players set CONFIG$generation.delay AroundTheWorld 80

tellraw @s [{"text":" ","color":"gray"},{"text":"Around The World","color":"aqua"},{"text":" > ","color":"white"},{"text":"Generation started!"}]
tellraw @s [{"text":" ","color":"gray"},{"text":"Around The World","color":"aqua"},{"text":" > ","color":"white"},{"text":"Stop generating","color":"red","underlined":true,"click_event":{"action":"suggest_command","command":"/tag @s remove AW_generate"}}]
tellraw @s [{"text":" ","color":"gray"},{"text":"Around The World","color":"aqua"},{"text":" > ","color":"white"},{"text":"Set generation delay","color":"yellow","underlined":true,"click_event":{"action":"suggest_command","command":"/scoreboard players set CONFIG$generation.delay AroundTheWorld "}},{"text":". (default 80 ticks)"}]