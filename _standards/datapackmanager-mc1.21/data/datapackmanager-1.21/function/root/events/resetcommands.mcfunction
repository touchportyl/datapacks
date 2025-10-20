# reset triggers
scoreboard players reset @a dm_help
scoreboard players reset @a dm_info
scoreboard players reset @a dm_version
scoreboard players reset @a dm_config
scoreboard players reset @a dm_uninstall

scoreboard players enable @a dm_help
scoreboard players enable @a dm_info
scoreboard players enable @a dm_version
scoreboard players enable @a[tag=DM_admin] dm_config
scoreboard players enable @a[tag=DM_admin] dm_uninstall