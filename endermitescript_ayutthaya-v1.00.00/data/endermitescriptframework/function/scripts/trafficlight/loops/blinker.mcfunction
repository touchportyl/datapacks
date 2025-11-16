execute as @e[tag=trafficlight,tag=walksignal,tag=blinker] at @s run playsound minecraft:block.note_block.iron_xylophone block @a[tag=!disable_traffic_blinker_sound,distance=..16] ~ ~ ~ 0.01 1.3 0

schedule function endermitescriptframework:scripts/trafficlight/loops/blinker 4t