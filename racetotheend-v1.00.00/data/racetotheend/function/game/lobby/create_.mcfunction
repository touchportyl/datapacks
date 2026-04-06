# summon marker
execute align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:marker ~ 300 ~ {Tags:["RaceToTheEnd","RE_lobby","RE_lobby_root"]}

scoreboard objectives add RE_NPCAnger dummy {"text":"Race to the End: Mannequin Anger Score"}

# build lobby
execute as @n[tag=RE_lobby_root] at @s run function racetotheend:game/lobby/build

# enable lobby game state
scoreboard players operation GAME$lobby RaceToTheEnd = BOOL$true RaceToTheEnd
function racetotheend:game/lobby/update
function racetotheend:_packages/gamerules/lobby
time set midnight
weather clear

# start lobby music
schedule function racetotheend:game/lobby/music/first 1s