# reset config triggers
execute as @s run function mydatapack:packages/configtriggers/disable
tellraw @s {"text":""}
execute as @s run function mydatapack:packages/events/command/config