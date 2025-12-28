summon minecraft:marker ~ ~ ~ {Tags:["RaceToTheEnd","RE_firework_spawner"]}

scoreboard players remove VAR$firework.spawners RaceToTheEnd 1
execute if score VAR$firework.spawners RaceToTheEnd matches 1.. run function racetotheend:game/podium/fireworks/spawner