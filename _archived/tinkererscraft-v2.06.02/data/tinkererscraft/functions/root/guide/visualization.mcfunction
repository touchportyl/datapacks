#> guidebook visualization

# remove the visualization from the previous tick
kill @e[tag=TC_guideBlock]

# displays a visualization of the smeltery whenever a player sneaks near a guidebook on the ground 
execute as @a if predicate tinkererscraft:player/is_sneaking at @s as @e[nbt={OnGround:1b,Item:{tag:{TC_GuideBook:1b}}},distance=..16,sort=nearest,limit=1] at @s unless entity @e[tag=TC_smeltery,distance=..15] run function tinkererscraft:root/guide/controller