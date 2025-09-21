# reset config triggers
execute as @s run function dimensionaldoors:packages/configtriggers/disable
tellraw @s {"text":""}
execute as @s run function dimensionaldoors:packages/events/command/config