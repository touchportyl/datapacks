execute if score GAME$active RaceToTheEnd = BOOL$true RaceToTheEnd run return run tellraw @s [{"text":"Cannot toggle assist mode when the game is active.","color":"red"}]
execute if score GAME$stopped RaceToTheEnd = BOOL$true RaceToTheEnd run return run tellraw @s [{"text":"Cannot toggle assist mode when the game is stopped.","color":"red"}]

execute as @s[tag=RE_assist] run return run function racetotheend:assist/disable
execute as @s[tag=!RE_assist] run return run function racetotheend:assist/enable