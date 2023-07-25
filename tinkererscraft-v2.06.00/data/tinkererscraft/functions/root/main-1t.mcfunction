# the main controller that runs the entirety of tinkerers craft
# runs on 1t intervals

#> item detection, filter, and sorter
# detects items thrown above gilded blackstone
# sorts them into their specific roles
# executes code based on what they're tagged as
# this is a very logical and linear if-else process, so everything is in one file
execute as @e[type=minecraft:item,nbt={OnGround:0b}] at @s if block ~ ~-2 ~ minecraft:gilded_blackstone run function tinkererscraft:root/smelting/classify


# riptide
# riptide relies on hurt detection which must be run on 1t
function tinkererscraft:root/enchants/riptide



#> guidebook visualization
# falling blocks disappear after 1t in 1.16, so it must run in the 1t function
execute if score VERSION$minecraft.current DatapackManager matches 16 run function tinkererscraft:root/guide/visualization