setblock ~ ~ ~ minecraft:air destroy
summon minecraft:tnt ~ ~ ~ {Tags:["RaceToTheEnd","RE_bed_explosion"],fuse:0,explosion_power:5}
data modify entity @n[tag=RE_bed_explosion] owner set from entity @s UUID