tellraw @a[tag=aw_debug] [{"text":"AW","color":"white"},{"text":" > packages/versioning/updates/v1.01.00.mcfunction","color":"gray"}]

function datapackmanager-1.21:packages/effects/ui/jingle

# update
scoreboard players set VERSION$datapack.latest AroundTheWorld 10100


# change color (light_purple) of "AroundTheWorld"
scoreboard objectives modify AroundTheWorld displayname [{"text":"Around The World","color":"light_purple"}]


# cleanup