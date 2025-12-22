execute at @n[tag=RE_probe] store result score VAR$distance.error RE_locator run locate structure minecraft:stronghold

# add 4,4 to coordinates to get entrance location, and set y to sea level for searching
execute as @n[tag=RE_probe] at @s run tp @s ~4 63 ~4

# search downwards for the exact y value of the stronghold entrance, then move downwards the set distance of the entrance staircase
function racetotheend:locator/stronghold/yfinder/tick
execute as @n[tag=RE_probe] at @s run tp @s ~ ~-9 ~

# get overworld coordinates
execute store result score VAR$overworld.x RE_locator run data get entity @n[tag=RE_probe] Pos[0] 1
execute store result score VAR$overworld.y RE_locator run data get entity @n[tag=RE_probe] Pos[1] 1
execute store result score VAR$overworld.z RE_locator run data get entity @n[tag=RE_probe] Pos[2] 1

# calculate nether coordinates
scoreboard players set VAR$nether.scale RE_locator 8

scoreboard players operation VAR$nether.x RE_locator = VAR$overworld.x RE_locator
scoreboard players operation VAR$nether.x RE_locator /= VAR$nether.scale RE_locator
scoreboard players operation VAR$nether.y RE_locator = VAR$overworld.y RE_locator
scoreboard players operation VAR$nether.z RE_locator = VAR$overworld.z RE_locator
scoreboard players operation VAR$nether.z RE_locator /= VAR$nether.scale RE_locator
scoreboard players operation VAR$distance.nether RE_locator = VAR$distance RE_locator
scoreboard players operation VAR$distance.nether RE_locator /= VAR$nether.scale RE_locator