# 1.13 compatibile
execute if score FLAG$dirty DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.21:root/listeners

scoreboard players enable @a dm_help
scoreboard players enable @a dm_info
scoreboard players enable @a dm_version