# fireworks
function racetotheend:game/podium/fireworks/trigger

# healing
execute as @a run effect give @s minecraft:instant_health 1 255 true
execute as @a run effect give @s minecraft:saturation 1 255 true
data modify entity @n[tag=RE_podium_mannequin] Health set value 20f

# particles
execute at @n[tag=RE_podium_root] run particle minecraft:firework ~ ~20 ~ 100 100 100 0 1000 force @a

# remove dragon egg
execute at @n[tag=RE_podium_root] positioned ~ ~3 ~ if block ~ ~ ~ minecraft:dragon_egg run setblock ~ ~ ~ minecraft:air replace

# loop
schedule function racetotheend:game/podium/update 28t