tellraw @a[tag=pt_debug] [{"text":"PT","color":"white"},{"text":" > packages/versioning/updates/v1.01.00.mcfunction","color":"gray"}]

function datapackmanager-1.21:packages/effects/ui/jingle

# update
scoreboard players set VERSION$datapack.latest PortylTrident 10100


# change color (light_purple) of "PortylTrident"
scoreboard objectives modify PortylTrident displayname [{"text":"Portyl Trident","color":"light_purple"}]


# cleanup