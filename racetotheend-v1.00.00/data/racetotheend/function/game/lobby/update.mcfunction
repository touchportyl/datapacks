# teleport players not in lobby back to lobby
execute as @a[tag=!RE_in_lobby] at @s run function racetotheend:game/lobby/sendtolobby

# untag players out of range of the lobby root
execute at @n[tag=RE_lobby_root] run tag @a[distance=16..,tag=RE_in_lobby] remove RE_in_lobby

# replace mannequin
execute unless entity @n[tag=RE_lobby_mannequin] run kill @n[tag=RE_lobby_mannequin_text_display]
execute unless entity @n[tag=RE_lobby_mannequin] run function racetotheend:game/lobby/mannequin

# jukebox interaction handler
function racetotheend:game/lobby/jukebox/interactionhandler

# heal players and mannequin
execute as @a[tag=RE_in_lobby] run effect give @s minecraft:instant_health 1 255 true
execute as @a[tag=RE_in_lobby] run effect give @s minecraft:saturation 1 255 true
data modify entity @n[tag=RE_lobby_mannequin] Health set value 20

#> particle effects

# lobby floating particles
execute at @n[tag=RE_lobby_root] run particle minecraft:dragon_breath ~ ~5 ~ 10 10 10 0.001 2 force @a[tag=RE_in_lobby]
execute at @n[tag=RE_lobby_root] run particle minecraft:firefly ~ ~5 ~ 10 10 10 0.001 2 force @a[tag=RE_in_lobby]

# player feet particles
execute at @a[tag=RE_in_lobby,nbt={OnGround:1b}] run particle minecraft:underwater ~ ~ ~ 0.3 0 0.3 0 30 force @a[tag=RE_in_lobby]
execute at @a[tag=RE_in_lobby,nbt={OnGround:1b}] run particle minecraft:underwater ~ ~ ~ 0.6 0 0.6 0 20 force @a[tag=RE_in_lobby]

# mannequin effects
# looks at the closest player
function racetotheend:game/lobby/mannequin/lookat
# kills you if you piss it off too much
function racetotheend:game/lobby/mannequin/interactionhandler

# loop
execute if score GAME$lobby RaceToTheEnd = BOOL$true RaceToTheEnd run schedule function racetotheend:game/lobby/update 1t