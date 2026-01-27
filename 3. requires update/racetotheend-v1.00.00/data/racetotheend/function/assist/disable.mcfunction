execute if score GAME$active RaceToTheEnd = BOOL$true RaceToTheEnd run return fail
execute if score GAME$stopped RaceToTheEnd = BOOL$true RaceToTheEnd run return fail

tag @s remove RE_assist
function racetotheend:_packages/effects/alert
tellraw @s [{"text":"You have disabled ","color":"yellow"},{"text":"Assist Mode","color":"gold","bold":true},{"text":".","color":"yellow"}]