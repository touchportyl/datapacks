tellraw @a[tag=dd_debug] [{"text":"DD","color":"light_purple"},{"text":" > packages/versioning/updates/v3.02.00.mcfunction","color":"gray"}]

function datapackmanager-1.21:packages/effects/ui_jingle

# update
scoreboard players set VERSION$datapack.latest DimensionalDoors 30200


# replace all AECs with armor stand markers

# 1. tag all deprecated entities
tag @e[tag=DD_portal] add DD_deprecated

# 2. summon new markers at each deprecated entity
execute as @e[tag=DD_portal,tag=DD_deprecated] at @s run function dimensionaldoors:root/create/datatagging/summon/door

# 3. tag with data
execute as @e[tag=DD_portal,tag=DD_deprecated] at @s as @e[tag=DD_portal,tag=!DD_deprecated,limit=1,sort=nearest,distance=..2] run function dimensionaldoors:root/create/datatagging/doortagger
execute as @e[tag=DD_portal,tag=DD_deprecated,tag=DD_entrance] at @s run tag @e[tag=DD_portal,tag=!DD_deprecated,limit=1,sort=nearest,distance=..2] add DD_entrance
execute as @e[tag=DD_portal,tag=DD_deprecated,tag=DD_exit] at @s run tag @e[tag=DD_portal,tag=!DD_deprecated,limit=1,sort=nearest,distance=..2] add DD_exit

# 4. transfer scoreboard data
execute as @e[tag=DD_portal,tag=!DD_deprecated] at @s run scoreboard players operation @s DD_doorID = @e[tag=DD_portal,tag=DD_deprecated,limit=1,sort=nearest,distance=..2] DD_doorID

# 5. remove all deprecated entities and clean up tags
kill @e[tag=DD_portal,tag=DD_deprecated]
tag @e[tag=DD_new] remove DD_close
tag @e[tag=DD_new] remove DD_new


# create config triggers (if not already created)
function harvester:packages/configtriggers/create