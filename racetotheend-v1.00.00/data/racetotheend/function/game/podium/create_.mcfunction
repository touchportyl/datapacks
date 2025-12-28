# build the podium
function racetotheend:game/podium/build

# spawn the winner
function racetotheend:game/podium/mannequin

# set the winner's skin
data modify entity @n[type=minecraft:mannequin] profile.id set from entity @n[tag=RE_winner] UUID

# tp all players to the podium, spread them out, and force them to look at the first place mannequin
spreadplayers ~16 ~ 2 8 false @a
execute as @a at @s run tp @s ~ ~ ~ facing entity @n[tag=RE_podium_mannequin]
execute as @a at @s run spawnpoint @s ~ ~ ~
execute as @a at @s run function racetotheend:_packages/effects/teleport

# start fireworks
function racetotheend:game/podium/fireworks/setup

# play victory music
playsound minecraft:music_disc.relic record @a ~ ~ ~ 1 1 0

# clean the map of entities
gamerule spawn_mobs false
tp @e[type=minecraft:enderman] 0 -65 0