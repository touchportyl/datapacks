# spawn positioner marker
summon minecraft:marker ~ ~ ~ {Tags:["RE_podium"]}

# start recursion
execute at @n[tag=RE_podium] run function racetotheend:game/podium/positioner_