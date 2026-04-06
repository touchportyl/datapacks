# reset config triggers
execute as @s run function seaskipper:packages/configtriggers/disable
tellraw @s {"text":""}
execute as @s run function seaskipper:packages/events/command/config