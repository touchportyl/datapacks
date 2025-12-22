function racetotheend:goldradar/cleanup
function racetotheend:playerlock/unlockall
function racetotheend:locator/cleanup
function racetotheend:dimensiontracker/cleanup
function racetotheend:

function racetotheend:stoploops

scoreboard objectives remove RE_SplitCount

scoreboard objectives remove RE_Nether
scoreboard objectives remove RE_Bastion
scoreboard objectives remove RE_EnderPearl
scoreboard objectives remove RE_Fortress
scoreboard objectives remove RE_BlazeRod
scoreboard objectives remove RE_Stronghold
scoreboard objectives remove RE_End
scoreboard objectives remove RE_KillDragon

scoreboard objectives remove RE_LockTimer

scoreboard objectives remove RE_Ranking

scoreboard objectives remove RaceToTheEnd

function racetotheend:_packages/gamerules/1.21.11

tellraw @a [{"text":" ","color":"gray"},{"text":"Race to the End","color":"light_purple"},{"text":" > "},{"text":"Datapack uninstalled!","color":"white"}]
execute as @a at @s run function racetotheend:_packages/effects/notification