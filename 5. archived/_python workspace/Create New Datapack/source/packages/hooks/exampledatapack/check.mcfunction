# hooks

# clear
#scoreboard players operation HOOK$ed.isHooked $datapackFullName = BOOL$false DatapackManager

# checks if the datapack is the right version
#execute if score VERSION$datapack.current ExampleDatapack matches 10000.. if score CONFIG$hooks.isEnabled ExampleDatapack = BOOL$true DatapackManager run scoreboard players operation HOOK$ed.isHooked $datapackFullName = BOOL$true DatapackManager