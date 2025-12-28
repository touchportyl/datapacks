# fireworks
function racetotheend:game/podium/fireworks/trigger

# healing
execute as @a[tag=RE_in_lobby] run effect give @s minecraft:instant_health 1 255 true
execute as @a[tag=RE_in_lobby] run effect give @s minecraft:saturation 1 255 true

# particles
execute at @n[tag=RE_podium_root] run particle minecraft:firework ~ ~20 ~ 100 100 100 0 1000 force @a

# loop
schedule function racetotheend:game/podium/update 28t