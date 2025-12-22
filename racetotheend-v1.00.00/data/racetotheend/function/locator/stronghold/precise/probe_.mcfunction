#$tellraw @s [{"text":"Probing with distance: ","color":"gray"},{"text":"$(distance)","color":"green"}]

# sample distances in all 8 directions

$execute unless score VAR$distance.xp.cull RE_locator matches 1 at @n[tag=RE_probe] positioned ~$(distance) ~ ~ store result score VAR$distance.xp RE_locator run locate structure minecraft:stronghold
$execute unless score VAR$distance.xn.cull RE_locator matches 1 at @n[tag=RE_probe] positioned ~-$(distance) ~ ~ store result score VAR$distance.xn RE_locator run locate structure minecraft:stronghold
$execute unless score VAR$distance.zp.cull RE_locator matches 1 at @n[tag=RE_probe] positioned ~ ~ ~$(distance) store result score VAR$distance.zp RE_locator run locate structure minecraft:stronghold
$execute unless score VAR$distance.zn.cull RE_locator matches 1 at @n[tag=RE_probe] positioned ~ ~ ~-$(distance) store result score VAR$distance.zn RE_locator run locate structure minecraft:stronghold
$execute unless score VAR$distance.xpzp.cull RE_locator matches 1 at @n[tag=RE_probe] positioned ~$(distance) ~ ~$(distance) store result score VAR$distance.xpzp RE_locator run locate structure minecraft:stronghold
$execute unless score VAR$distance.xpzn.cull RE_locator matches 1 at @n[tag=RE_probe] positioned ~$(distance) ~ ~-$(distance) store result score VAR$distance.xpzn RE_locator run locate structure minecraft:stronghold
$execute unless score VAR$distance.xnzp.cull RE_locator matches 1 at @n[tag=RE_probe] positioned ~-$(distance) ~ ~$(distance) store result score VAR$distance.xnzp RE_locator run locate structure minecraft:stronghold
$execute unless score VAR$distance.xnzn.cull RE_locator matches 1 at @n[tag=RE_probe] positioned ~-$(distance) ~ ~-$(distance) store result score VAR$distance.xnzn RE_locator run locate structure minecraft:stronghold

# cull directions that are not improvements permanently

#execute if score VAR$distance.xp RE_locator > VAR$distance.c RE_locator run scoreboard players set VAR$distance.xp.cull RE_locator 1
#execute if score VAR$distance.xn RE_locator > VAR$distance.c RE_locator run scoreboard players set VAR$distance.xn.cull RE_locator 1
#execute if score VAR$distance.zp RE_locator > VAR$distance.c RE_locator run scoreboard players set VAR$distance.zp.cull RE_locator 1
#execute if score VAR$distance.zn RE_locator > VAR$distance.c RE_locator run scoreboard players set VAR$distance.zn.cull RE_locator 1
#execute if score VAR$distance.xpzp RE_locator > VAR$distance.c RE_locator run scoreboard players set VAR$distance.xpzp.cull RE_locator 1
#execute if score VAR$distance.xpzn RE_locator > VAR$distance.c RE_locator run scoreboard players set VAR$distance.xpzn.cull RE_locator 1
#execute if score VAR$distance.xnzp RE_locator > VAR$distance.c RE_locator run scoreboard players set VAR$distance.xnzp.cull RE_locator 1
#execute if score VAR$distance.xnzn RE_locator > VAR$distance.c RE_locator run scoreboard players set VAR$distance.xnzn.cull RE_locator 1

# find nearest direction (min)

scoreboard players operation VAR$distance.min RE_locator = VAR$distance.xp RE_locator
execute if score VAR$distance.xn RE_locator < VAR$distance.min RE_locator run scoreboard players operation VAR$distance.min RE_locator = VAR$distance.xn RE_locator
execute if score VAR$distance.zp RE_locator < VAR$distance.min RE_locator run scoreboard players operation VAR$distance.min RE_locator = VAR$distance.zp RE_locator
execute if score VAR$distance.zn RE_locator < VAR$distance.min RE_locator run scoreboard players operation VAR$distance.min RE_locator = VAR$distance.zn RE_locator
execute if score VAR$distance.xpzp RE_locator < VAR$distance.min RE_locator run scoreboard players operation VAR$distance.min RE_locator = VAR$distance.xpzp RE_locator
execute if score VAR$distance.xpzn RE_locator < VAR$distance.min RE_locator run scoreboard players operation VAR$distance.min RE_locator = VAR$distance.xpzn RE_locator
execute if score VAR$distance.xnzp RE_locator < VAR$distance.min RE_locator run scoreboard players operation VAR$distance.min RE_locator = VAR$distance.xnzp RE_locator
execute if score VAR$distance.xnzn RE_locator < VAR$distance.min RE_locator run scoreboard players operation VAR$distance.min RE_locator = VAR$distance.xnzn RE_locator

# determine step direction and move probe

$execute if score VAR$distance.xp RE_locator = VAR$distance.min RE_locator run return run tp @n[tag=RE_probe] ~$(distance) ~ ~
$execute if score VAR$distance.xn RE_locator = VAR$distance.min RE_locator run return run tp @n[tag=RE_probe] ~-$(distance) ~ ~
$execute if score VAR$distance.zp RE_locator = VAR$distance.min RE_locator run return run tp @n[tag=RE_probe] ~ ~ ~$(distance)
$execute if score VAR$distance.zn RE_locator = VAR$distance.min RE_locator run return run tp @n[tag=RE_probe] ~ ~ ~-$(distance)

$execute if score VAR$distance.xpzp RE_locator = VAR$distance.min RE_locator run return run tp @n[tag=RE_probe] ~$(distance) ~ ~$(distance)
$execute if score VAR$distance.xpzn RE_locator = VAR$distance.min RE_locator run return run tp @n[tag=RE_probe] ~$(distance) ~ ~-$(distance)
$execute if score VAR$distance.xnzp RE_locator = VAR$distance.min RE_locator run return run tp @n[tag=RE_probe] ~-$(distance) ~ ~$(distance)
$execute if score VAR$distance.xnzn RE_locator = VAR$distance.min RE_locator run return run tp @n[tag=RE_probe] ~-$(distance) ~ ~-$(distance)