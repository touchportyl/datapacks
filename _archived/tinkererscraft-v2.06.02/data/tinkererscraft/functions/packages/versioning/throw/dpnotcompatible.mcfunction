tellraw @a[tag=tc_debug] [{"text":"TC","color":"gold"},{"text":" > packages/versioning/throw/dpnotcompatible.mcfunction","color":"gray"}]

scoreboard players operation ALERT$dpbackcompatibility TinkerersCraft = BOOL$true DatapackManager
scoreboard players operation VERSION$datapack.latest TinkerersCraft = VERSION$datapack.current TinkerersCraft
scoreboard players operation FLAG$dirty TinkerersCraft = BOOL$true DatapackManager