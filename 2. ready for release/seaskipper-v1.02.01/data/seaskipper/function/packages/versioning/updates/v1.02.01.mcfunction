tellraw @a[tag=ss_debug] [{"text":"SS","color":"white"},{"text":" > packages/versioning/updates/v1.02.01.mcfunction","color":"gray"}]

function datapackmanager-1.21:packages/effects/ui/jingle

# update
scoreboard players set VERSION$datapack.latest Seaskipper 10201


# remove obsolete objectives
scoreboard objectives remove talkedToVillager


# cleanup