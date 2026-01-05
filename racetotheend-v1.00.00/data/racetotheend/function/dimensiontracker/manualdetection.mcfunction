# manually detect players in dimension
tag @s add RE_dimensiontracker_manualdetection

execute in minecraft:overworld positioned 0 0 0 if entity @a[distance=0..,tag=RE_dimensiontracker_manualdetection] run team join RE_Overworld @s
execute in minecraft:the_nether positioned 0 0 0 if entity @a[distance=0..,tag=RE_dimensiontracker_manualdetection] run team join RE_Nether @s
execute in minecraft:the_end positioned 0 0 0 if entity @a[distance=0..,tag=RE_dimensiontracker_manualdetection] run team join RE_End @s

function racetotheend:locator/updatebossbarplayers

tag @s remove RE_dimensiontracker_manualdetection