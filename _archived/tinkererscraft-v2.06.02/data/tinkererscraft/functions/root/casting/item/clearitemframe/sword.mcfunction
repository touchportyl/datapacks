# clears items from an item frame

data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_sword",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}

execute as @s at @s if score VERSION$minecraft.current DatapackManager matches 17.. run function tinkererscraft:compatibility/casting/item/clearitemframe-mc1.17/sword