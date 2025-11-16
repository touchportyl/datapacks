execute as @n[tag=EndermiteScriptFramework,tag=trafficlight,distance=..2] at @s if block ^ ^ ^1 minecraft:light[level=15] run setblock ^ ^ ^1 minecraft:air replace
execute as @n[tag=EndermiteScriptFramework,tag=trafficlight,distance=..2] at @s if block ~ ~1 ~ minecraft:player_wall_head run setblock ~ ~1 ~ minecraft:air replace
execute as @n[tag=EndermiteScriptFramework,tag=trafficlight,distance=..2] at @s if block ~ ~ ~ minecraft:player_wall_head run setblock ~ ~ ~ minecraft:air replace

kill @n[tag=EndermiteScriptFramework,tag=trafficlight,distance=..2]