# notify
tellraw @a [{"text":"","color":"gray"},{"text":" + ","color":"green"},{"text":"Dimensional Doors","color":"white"},{"text":" >","color":"white"},{"text":" Installed."}]

# load the default config
function dimensionaldoors:defaultconfig


# scoreboard objectives
scoreboard objectives add DD_doorID dummy [{"text":"Door ID","color":"light_purple"}]
scoreboard objectives add DD_warpcooldown dummy [{"text":"Warp Cooldown","color":"light_purple"}]