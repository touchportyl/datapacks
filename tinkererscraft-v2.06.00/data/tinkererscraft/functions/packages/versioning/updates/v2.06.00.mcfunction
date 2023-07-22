tellraw @a[tag=tc_debug] [{"text":"TC","color":"gold"},{"text":" > packages/versioning/updates/v2.06.00.mcfunction","color":"gray"}]

# notify
tellraw @a [{"text":"","color":"green","hoverEvent":{"action":"show_text","value":"Alert from Tinkerer's Craft"}},{"text":" +"},{"text":" Tinkerer's Craft ","color":"gold","bold":true,"hoverEvent":{"action":"show_text","value":"Metallurgy and metal casting brought to Minecraft! Cast your own equipment out of newly discovered alloys!"}},{"text":"v2.06.00","color":"gray"},{"text":" > ","color":"white"},{"text":"Tinkerer's Craft updated from v2.00.00 to v2.06.00"}]

function datapackmanager-1.20:packages/effects/ui_jingle

# update
scoreboard players set VERSION$datapack.latest TinkerersCraft 20600
scoreboard players set $tc.version TP_version 20000

# cleanup

# old version
scoreboard players reset $tc.version TP_version
scoreboard players reset $tc.api TP_version
scoreboard players reset $api.tc.h TP_version

scoreboard objectives remove TC_rand_6
scoreboard objectives remove TC_rand_20
scoreboard objectives remove TC_NumberArray