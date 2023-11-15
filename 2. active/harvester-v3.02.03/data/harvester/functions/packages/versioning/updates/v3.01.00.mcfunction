tellraw @a[tag=hv_debug] [{"text":"HV","color":"gold"},{"text":" > packages/versioning/updates/v3.01.00.mcfunction","color":"gray"}]

# notify
tellraw @a [{"text":"","color":"gold","hoverEvent":{"action":"show_text","value":"Alert from Harvester"}},{"text":" +"},{"text":" Harvester ","color":"gold","bold":true,"hoverEvent":{"action":"show_text","value":"Harvest and replant crops efficiently with a hoe!"}},{"text":"v3.02.03","color":"gray"},{"text":" > ","color":"white"},{"text":"Harvester updated from v2.0 to v3.01.00"}]

function datapackmanager-1.20:packages/effects/ui_jingle

# update
scoreboard players set VERSION$datapack.latest Harvester 30100


# cleanup
scoreboard objectives remove H_rand

scoreboard players reset $h.version TP_version
scoreboard players reset $h.api TP_version

tag @a remove H_wood
tag @a remove H_stone
tag @a remove H_gold
tag @a remove H_iron
tag @a remove H_diamond
tag @a remove H_netherite

tag @a remove H_1x1
tag @a remove H_3x3_star
tag @a remove H_3x3
tag @a remove H_3x3_netherwart

tag @a remove H_wheat
tag @a remove H_potato
tag @a remove H_carrot
tag @a remove H_beetroot
tag @a remove H_netherwart

tag @a remove H_success