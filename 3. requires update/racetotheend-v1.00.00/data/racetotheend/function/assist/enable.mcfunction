execute if score GAME$active RaceToTheEnd = BOOL$true RaceToTheEnd run return fail
execute if score GAME$stopped RaceToTheEnd = BOOL$true RaceToTheEnd run return fail

tag @s add RE_assist
function racetotheend:_packages/effects/notification
tellraw @s [{"text":"You have enabled ","color":"yellow"},{"text":"Assist Mode","color":"gold","bold":true},{"text":".","color":"yellow"}]