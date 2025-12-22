# reset config triggers
execute as @s run function aroundtheworld:packages/configtriggers/disable
tellraw @s {"text":""}
execute as @s run function aroundtheworld:packages/events/command/config