# this is for locks that have to be deferred to allow minecraft to update (e.g. on death)
# tag the player with RE_deferredlock before scheduling this function
# for example:
# - tag @s add RE_deferredlock
# - schedule function racetotheend:playerlock/deferredlock 1t replace
execute as @a[tag=RE_deferredlock] at @s run function racetotheend:playerlock/lock
tag @a[tag=RE_deferredlock] remove RE_deferredlock