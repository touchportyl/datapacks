# DatapackManager owns no settings itself. It tags the requesting player and broadcasts on the
# public bus, so each installed datapack renders its own config menu for that player this tick.
tag @s add DatapackManager_config
function #datapackmanager:event/command_config
tag @s remove DatapackManager_config
