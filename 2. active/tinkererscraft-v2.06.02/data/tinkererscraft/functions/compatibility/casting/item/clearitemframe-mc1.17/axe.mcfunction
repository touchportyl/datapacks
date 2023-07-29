# clears items from an item frame

data modify entity @e[type=minecraft:glow_item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_axe",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}