scoreboard objectives add RaceToTheEnd dummy [{"text":"Race To The End","color":"light_purple"}]

scoreboard objectives add RE_Ranking dummy [{"text":"Race to the End: Ranking Points","color":"light_purple"}]

scoreboard objectives add RE_SplitCount dummy [{"text":"- Race to the End -","bold":true}]
scoreboard objectives setdisplay sidebar RE_SplitCount

scoreboard objectives add RE_Nether dummy [{"text":"Race To The End: Split - Enter the Nether","color":"light_purple"}]
scoreboard objectives add RE_Bastion dummy [{"text":"Race To The End: Split - Find a Bastion","color":"light_purple"}]
scoreboard objectives add RE_EnderPearl dummy [{"text":"Race To The End: Split - Collect Ender Pearls","color":"light_purple"}]
scoreboard objectives add RE_Fortress dummy [{"text":"Race To The End: Split - Find a Nether Fortress","color":"light_purple"}]
scoreboard objectives add RE_BlazeRod dummy [{"text":"Race To The End: Split - Get a Blaze Rod","color":"light_purple"}]
scoreboard objectives add RE_Stronghold dummy [{"text":"Race To The End: Split - Locate the Stronghold","color":"light_purple"}]
scoreboard objectives add RE_End dummy [{"text":"Race To The End: Split - Activate the End Portal","color":"light_purple"}]
scoreboard objectives add RE_KillDragon dummy [{"text":"Race To The End: Split - Slay the Enderdragon","color":"light_purple"}]

scoreboard objectives add RE_LockTimer dummy [{"text":"Race To The End: Player Lock Timer","color":"light_purple"}]

scoreboard objectives add RE_Health health [{"text":"Race To The End: Health","color":"light_purple"}]
scoreboard objectives setdisplay list RE_Health

function racetotheend:dimensiontracker/setup

function racetotheend:stoploops
function racetotheend:startloops

tellraw @a [{"text":" ","color":"gray"},{"text":"Race to the End","color":"light_purple"},{"text":" > "},{"text":"Datapack loaded!","color":"white"}]
execute as @a at @s run function racetotheend:_packages/effects/notification