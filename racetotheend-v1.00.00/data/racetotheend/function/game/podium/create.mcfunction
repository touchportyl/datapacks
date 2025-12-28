# build the podium using the bed marker as the reference point
execute as @n[tag=RE_bed_marker] at @s run summon minecraft:marker ~ ~ ~ {Tags:["RaceToTheEnd","RE_podium","RE_podium_root"]}
kill @e[tag=RE_bed_marker]
execute as @n[tag=RE_podium_root] at @s run function racetotheend:game/podium/create_