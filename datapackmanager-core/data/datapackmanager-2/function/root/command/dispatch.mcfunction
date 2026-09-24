# Runs as the player who typed the command. Matching the full integer range (not 1..) catches
# `set 0` and negative values too; without that, /trigger would disable itself for that player
# and lock them out permanently.
execute if score @s dm_command matches 1 run function datapackmanager-2:root/command/verb/help
execute if score @s dm_command matches 2 run function datapackmanager-2:root/command/verb/info
execute if score @s dm_command matches 3 run function datapackmanager-2:root/command/verb/version
execute if score @s dm_command matches 4 run function datapackmanager-2:root/command/verb/config
execute if score @s dm_command matches 5 run function datapackmanager-2:root/command/verb/uninstall

# Third-party datapacks register their own verbs (numbers >= 100) in this public tag.
function #datapackmanager:command

# Consume the trigger and re-arm this one player. No @a work.
scoreboard players reset @s dm_command
scoreboard players enable @s dm_command
