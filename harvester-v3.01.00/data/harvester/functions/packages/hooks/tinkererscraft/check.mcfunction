# hooks

# clear
scoreboard players operation HOOK$tc.isHooked Harvester = BOOL$false DatapackManager

# checks if the datapack is the right version
execute if score VERSION$datapack.current TinkerersCraft matches 40000.. if score CONFIG$hooks.isEnabled TinkerersCraft = BOOL$true DatapackManager run scoreboard players operation HOOK$tc.isHooked Harvester = BOOL$true DatapackManager

# alert
execute if score HOOK$tc.isHooked Harvester = BOOL$true DatapackManager run function harvester:packages/alerts/hooksuccess_tc