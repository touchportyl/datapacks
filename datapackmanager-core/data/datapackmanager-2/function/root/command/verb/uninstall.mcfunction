# Broadcast, don't act. Each datapack tears down its own state; whichever is last removes the
# shared objectives. The player is tagged so a datapack can scope its teardown to this request.
tag @s add DatapackManager_uninstall
function #datapackmanager:event/command_uninstall
tag @s remove DatapackManager_uninstall
tellraw @s [{"text":"[DatapackManager] ","color":"gray"},{"text":"Uninstall broadcast to all datapacks. Remove the files and reload to finish.","color":"yellow"}]
