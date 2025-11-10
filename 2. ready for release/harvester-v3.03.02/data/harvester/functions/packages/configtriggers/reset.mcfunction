# reset config triggers
execute as @s run function harvester:packages/configtriggers/disable
tellraw @s {"text":""}
execute as @s run function harvester:packages/events/command/config