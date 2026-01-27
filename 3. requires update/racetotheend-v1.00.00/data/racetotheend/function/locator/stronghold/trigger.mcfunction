# reset the advancement so it can be granted again
advancement revoke @s only racetotheend:locator/stronghold

# guard if locator is already running
execute if score VAR$isActive RE_locator = BOOL$true RaceToTheEnd run return run function racetotheend:locator/stronghold/cancel

function racetotheend:locator/stronghold/initialize
function racetotheend:locator/updatebossbarplayers