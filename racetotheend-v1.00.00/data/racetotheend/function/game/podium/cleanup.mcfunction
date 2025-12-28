# this will never be run since the world would have to be reset now
# here just for testing purposes

function racetotheend:game/podium/fireworks/cleanup

stopsound @a record

schedule clear racetotheend:game/podium/update

execute at @n[tag=RE_podium_root] run fill ~4 ~-3 ~4 ~-4 100 ~-4 minecraft:air replace
execute at @n[tag=RE_podium_root] run fill ~ ~-3 ~ ~ ~-1 ~ minecraft:bedrock replace

tp @e[tag=RE_podium] ~ -65 ~
kill @e[tag=RE_podium]