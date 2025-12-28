scoreboard players reset @s RE_DeathTrigger

execute if score GAME$active RaceToTheEnd = BOOL$false RaceToTheEnd run return fail
execute unless score @s RE_SplitCount matches 1.. run return fail

function racetotheend:dimensiontracker/triggers/overworld

function racetotheend:playerlock/lock
scoreboard players set @s RE_DeathTimer 100
function racetotheend:countdown/death/start {t:5}