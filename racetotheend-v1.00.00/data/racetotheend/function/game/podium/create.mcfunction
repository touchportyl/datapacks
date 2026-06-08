# guard
execute if score GAME$podium RaceToTheEnd = BOOL$true RaceToTheEnd run return run tellraw @a [{"text":" ","color":"gray"},{"text":"Race to the End","color":"light_purple"},{"text":" > "},{"text":"Unable to create podium because the game's state is already in podium.","color":"white"},{"text":" (../racetotheend/function/game/podium/create.mcfunction)","color":"gray"}]


# state
scoreboard players operation GAME$podium RaceToTheEnd = BOOL$true RaceToTheEnd

# build the podium using the bed marker as the reference point
execute as @n[tag=RE_bed_marker] at @s run summon minecraft:marker ~ ~ ~ {Tags:["RaceToTheEnd","RE_podium","RE_podium_root"]}
kill @e[tag=RE_bed_marker]
execute as @n[tag=RE_podium_root] at @s run function racetotheend:game/podium/create_