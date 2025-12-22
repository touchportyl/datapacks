# look for the dragon egg at 0 ~ 0 and build the podium using that as the reference point
execute in minecraft:the_end positioned 0 0 0 run function racetotheend:game/podium/positioner
execute as @n[tag=RE_podium] at @s run function racetotheend:game/podium/build

# spawn the 3 podium players with names
#data modify entity @n[type=minecraft:mannequin] profile.id set from entity touchportyl UUID