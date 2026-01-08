# this is for locks that have to be deferred to allow minecraft to update (e.g. on death)
# tag the player with RE_locked before scheduling this function
# for example:
# - tag @s add RE_locked
# - schedule function racetotheend:playerlock/deferredlock 1t replace
execute as @a[tag=RE_locked] at @s run racetotheend:playerlock/lock