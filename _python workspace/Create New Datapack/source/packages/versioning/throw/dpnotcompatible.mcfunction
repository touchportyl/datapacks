tellraw @a[tag=$datapackID_lower_debug] [{"text":"$datapackID","color":"$datapackColor"},{"text":" > packages/versioning/throw/dpnotcompatible.mcfunction","color":"gray"}]

scoreboard players operation ALERT$dpbackcompatibility $datapackFullName = BOOL$true DatapackManager
scoreboard players operation VERSION$datapack.latest $datapackFullName = VERSION$datapack.current $datapackFullName
scoreboard players operation FLAG$dirty $datapackFullName = BOOL$true DatapackManager