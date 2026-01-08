# note that this runs globally for all players
$scoreboard players set VAR$countdown RaceToTheEnd $(t)
$scoreboard players set VAR$countdown.total RaceToTheEnd $(t)
function racetotheend:countdown/set
function racetotheend:countdown/game/ticker