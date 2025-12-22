function racetotheend:locator/stronghold/cleanup
scoreboard objectives add RE_locator dummy {"text":"Race to the End: Locator Helper"}

scoreboard players set VAR$loop.limit RE_locator 1024
scoreboard players set VAR$loop.counter RE_locator 0

# tag caster
tag @a remove RE_locator_caster
tag @s add RE_locator_caster

# save caster location
summon minecraft:armor_stand ~ ~ ~ {Tags:["RaceToTheEnd","RE_cast_location"],NoGravity:1b,Invisible:1b,Marker:1b}
tp @n[tag=RE_cast_location] @s
forceload add ~ ~

# tag eye
tag @n[type=minecraft:eye_of_ender,distance=..1] add RE_eye

# get distance
execute store result score VAR$distance RE_locator run locate structure minecraft:stronghold
scoreboard players operation VAR$ticker RE_locator = VAR$distance RE_locator

# skip to short range locator
execute if score VAR$distance RE_locator matches ..95 run return run schedule function racetotheend:locator/stronghold/precise/start 1t

# start long range locator
execute if score VAR$distance RE_locator matches 96.. run schedule function racetotheend:locator/stronghold/range/start 2t