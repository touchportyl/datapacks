function racetotheend:locator/stronghold/cleanup
scoreboard objectives add RE_locator dummy {"text":"Race to the End: Locator Helper"}
scoreboard players operation VAR$isActive RE_locator = BOOL$true RaceToTheEnd

scoreboard players set VAR$loop.limit RE_locator 1024
scoreboard players set VAR$loop.counter RE_locator 0

# tag caster
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

# start locator
schedule function racetotheend:locator/stronghold/range/start 5t