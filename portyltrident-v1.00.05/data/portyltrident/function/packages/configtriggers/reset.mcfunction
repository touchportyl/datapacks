# reset config triggers
execute as @s run function portyltrident:packages/configtriggers/disable
tellraw @s {"text":""}
execute as @s run function portyltrident:packages/events/command/config