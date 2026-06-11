tellraw @a[tag=md_debug] [{"text":"MD","color":"white"},{"text":" > packages/versioning/updates/v1.01.00.mcfunction","color":"gray"}]

function datapackmanager-1.21:packages/effects/ui/jingle

# update
scoreboard players set VERSION$datapack.latest MyDatapack 10100


# change color (light_purple) of "MyDatapack"
scoreboard objectives modify MyDatapack displayname [{"text":"My Datapack","color":"light_purple"}]


# cleanup