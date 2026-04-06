tellraw @a[tag=aw_debug] [{"text":"AW","color":"blue"},{"text":" > packages/versioning/updates/v2.00.00.mcfunction","color":"gray"}]

# notify
tellraw @a [{"text":"","color":"green","hoverEvent":{"action":"show_text","value":"Alert from Around the World"}},{"text":" +"},{"text":" Around the World ","color":"blue","bold":true,"hoverEvent":{"action":"show_text","value":"The world is now round with this datapack. Travel in a straight line and find yourself back where you started!"}},{"text":"v1.01.01","color":"gray"},{"text":" > ","color":"white"},{"text":"Around the World updated from v1.00.00 to v2.00.00"}]

function datapackmanager-1.20:packages/effects/ui_jingle

# update
scoreboard players set VERSION$datapack.latest AroundTheWorld 20000


# cleanup