tellraw @a[tag=aw_debug] [{"text":"AW","color":"blue"},{"text":" > packages/versioning/throw/dpnotcompatible.mcfunction","color":"gray"}]

scoreboard players operation ALERT$dpbackcompatibility DatapackManager = BOOL$true DatapackManager
scoreboard players operation VERSION$datapack.latest AroundTheWorld = VERSION$datapack.current AroundTheWorld
scoreboard players operation FLAG$dirty DatapackManager = BOOL$true DatapackManager