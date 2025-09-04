particle minecraft:white_smoke ~ 0 ~ 0 0 0 1 1
scoreboard players set VERSION$minecraft.current DatapackManager 12003
scoreboard players set VERSION$minecraft.current.major DatapackManager 1
scoreboard players set VERSION$minecraft.current.minor DatapackManager 20
scoreboard players set VERSION$minecraft.current.patch DatapackManager 3

scoreboard players operation FLAG$nbt.version.old DatapackManager = BOOL$false DatapackManager
scoreboard players operation FLAG$nbt.version.1.20.3 DatapackManager = BOOL$true DatapackManager