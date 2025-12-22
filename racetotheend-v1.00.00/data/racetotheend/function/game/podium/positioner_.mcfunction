# guard: stop at 300 blocks
execute store result score VAR$podium.y RaceToTheEnd run data get entity @n[tag=RE_podium] Pos[1] 1
execute if score VAR$podium.y RaceToTheEnd matches 300.. run return run kill @e[tag=RE_podium]

# move up 1 block
tp @n[tag=RE_podium] ~ ~1 ~

# recursion step
execute unless block ~ ~ ~ minecraft:dragon_egg at @n[tag=RE_podium] run function racetotheend:game/podium/positioner_