scoreboard players reset @s RE_DeathTrigger

# update the player's team
function racetotheend:dimensiontracker/manualdetection

# ignore if the game isn't active
# or the player hasn't started a run because split count will be 1 or more
execute if score GAME$active RaceToTheEnd = BOOL$false RaceToTheEnd run return fail
execute unless score @s RE_SplitCount matches 1.. run return fail

# defer the lock to allow minecraft to update properly
tag @s add RE_deferredlock
schedule function racetotheend:playerlock/deferredlock 10t replace

# set the death countdown timer
scoreboard players set VAR$respawntime RE_DeathTimer 100
scoreboard players operation @s RE_DeathTimer = VAR$respawntime RE_DeathTimer