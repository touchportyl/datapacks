# tag
function dimensionaldoors:root/create/datatagging/doortagger
tag @s add DD_entrance

# generate doorID for new doors
execute as @s at @s run scoreboard players operation @s DD_doorID = DD$doorID.current DD_doorID

# forceload chunks
forceload add ~ ~

# advancement
advancement grant @a[distance=..7] only dimensionaldoors:adventure/create_door

# effects
function dimensionaldoors:effects/doorcreation