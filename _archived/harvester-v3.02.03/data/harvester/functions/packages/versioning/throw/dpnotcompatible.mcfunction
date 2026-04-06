tellraw @a[tag=hv_debug] [{"text":"HV","color":"gold"},{"text":" > packages/versioning/throw/dpnotcompatible.mcfunction","color":"gray"}]

scoreboard players operation ALERT$dpbackcompatibility Harvester = BOOL$true DatapackManager
scoreboard players operation VERSION$datapack.latest Harvester = VERSION$datapack.current Harvester
scoreboard players operation FLAG$dirty Harvester = BOOL$true DatapackManager