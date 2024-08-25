# notify
tellraw @a [{"text":"","color":"gray"},{"text":" + ","color":"green"},{"text":"My Datapack","color":"white"},{"text":" >","color":"white"},{"text":" Updated from v1.00.00 to v1.01.00."}]

function datapackmanager-1.21:packages/effects/ui/jingle

# update
scoreboard players set VERSION$datapack.latest MyDatapack 10100


# change color (light_purple) of "MyDatapack"
scoreboard objectives modify MyDatapack displayname [{"text":"My Datapack","color":"light_purple"}]


# cleanup