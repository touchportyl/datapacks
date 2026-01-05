execute if score GAME$active RaceToTheEnd = BOOL$true RaceToTheEnd run return fail
execute if score GAME$stopped RaceToTheEnd = BOOL$true RaceToTheEnd run return fail

execute as @s[tag=RE_assist] run return run function racetotheend:assist/disable
execute as @s[tag=!RE_assist] run return run function racetotheend:assist/enable