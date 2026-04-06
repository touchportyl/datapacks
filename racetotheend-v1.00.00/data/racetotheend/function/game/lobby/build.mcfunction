# bounds
fill ~-10 ~-1 ~-10 ~10 ~7 ~10 minecraft:barrier hollow

# lighting
fill ~-9 ~6 ~-9 ~9 ~6 ~9 minecraft:light[level=15] outline

# jukebox
execute positioned ~ ~ ~4 run function racetotheend:game/lobby/jukebox

# credits
execute positioned ~ ~ ~-6 run function racetotheend:game/lobby/mannequin

# title
execute positioned ~ ~10 ~-15 run function racetotheend:game/lobby/title