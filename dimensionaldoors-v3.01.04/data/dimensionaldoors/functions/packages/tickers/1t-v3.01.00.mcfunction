# run code every tick (20 times a second)

# effect range = 32
execute at @e[tag=DD_portal] if entity @a[distance=..32] run function dimensionaldoors:effects/ambience/door

execute as @e[tag=DD_particleLink] at @s run function dimensionaldoors:effects/ambience/linkedconduit


# check for destroyed doors
function dimensionaldoors:root/destroy/filter

# check for warping entities
# only check if a player is close enough to a door
execute at @e[tag=DD_portal] if entity @a[distance=..7] run function dimensionaldoors:root/detection/positioner

# close door
execute as @e[tag=DD_portal,tag=DD_close] at @s run function dimensionaldoors:root/closermechanism/main



# tick
execute unless score LOOP$tickers.1t.isLooping DimensionalDoors = BOOL$false DatapackManager run schedule function dimensionaldoors:packages/tickers/1t-v3.01.00 1t