# check for any beds being placed by a player
execute at @n[tag=RE_bed_marker] if block ~ ~ ~ minecraft:black_bed as @a if score @s RE_placedbed1 matches 1.. run function racetotheend:beddetection/trigger
execute at @n[tag=RE_bed_marker] if block ~ ~ ~ minecraft:blue_bed as @a if score @s RE_placedbed2 matches 1.. run function racetotheend:beddetection/trigger
execute at @n[tag=RE_bed_marker] if block ~ ~ ~ minecraft:brown_bed as @a if score @s RE_placedbed3 matches 1.. run function racetotheend:beddetection/trigger
execute at @n[tag=RE_bed_marker] if block ~ ~ ~ minecraft:cyan_bed as @a if score @s RE_placedbed4 matches 1.. run function racetotheend:beddetection/trigger
execute at @n[tag=RE_bed_marker] if block ~ ~ ~ minecraft:gray_bed as @a if score @s RE_placedbed5 matches 1.. run function racetotheend:beddetection/trigger
execute at @n[tag=RE_bed_marker] if block ~ ~ ~ minecraft:green_bed as @a if score @s RE_placedbed6 matches 1.. run function racetotheend:beddetection/trigger
execute at @n[tag=RE_bed_marker] if block ~ ~ ~ minecraft:light_blue_bed as @a if score @s RE_placedbed7 matches 1.. run function racetotheend:beddetection/trigger
execute at @n[tag=RE_bed_marker] if block ~ ~ ~ minecraft:light_gray_bed as @a if score @s RE_placedbed8 matches 1.. run function racetotheend:beddetection/trigger
execute at @n[tag=RE_bed_marker] if block ~ ~ ~ minecraft:lime_bed as @a if score @s RE_placedbed9 matches 1.. run function racetotheend:beddetection/trigger
execute at @n[tag=RE_bed_marker] if block ~ ~ ~ minecraft:magenta_bed as @a if score @s RE_placedbed10 matches 1.. run function racetotheend:beddetection/trigger
execute at @n[tag=RE_bed_marker] if block ~ ~ ~ minecraft:orange_bed as @a if score @s RE_placedbed11 matches 1.. run function racetotheend:beddetection/trigger
execute at @n[tag=RE_bed_marker] if block ~ ~ ~ minecraft:pink_bed as @a if score @s RE_placedbed12 matches 1.. run function racetotheend:beddetection/trigger
execute at @n[tag=RE_bed_marker] if block ~ ~ ~ minecraft:purple_bed as @a if score @s RE_placedbed13 matches 1.. run function racetotheend:beddetection/trigger
execute at @n[tag=RE_bed_marker] if block ~ ~ ~ minecraft:red_bed as @a if score @s RE_placedbed14 matches 1.. run function racetotheend:beddetection/trigger
execute at @n[tag=RE_bed_marker] if block ~ ~ ~ minecraft:white_bed as @a if score @s RE_placedbed15 matches 1.. run function racetotheend:beddetection/trigger
execute at @n[tag=RE_bed_marker] if block ~ ~ ~ minecraft:yellow_bed as @a if score @s RE_placedbed16 matches 1.. run function racetotheend:beddetection/trigger

# reset bed tracking scoreboards
execute as @a run function racetotheend:beddetection/reset

# loop
schedule function racetotheend:beddetection/update 1t