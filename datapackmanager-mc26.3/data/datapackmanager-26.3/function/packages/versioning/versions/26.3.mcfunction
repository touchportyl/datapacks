# probe: the poplar log block was added in 26.3
execute if block ~ ~ ~ minecraft:poplar_log
scoreboard players set VERSION$minecraft.current DatapackManager 12603
scoreboard players set VERSION$minecraft.current.major DatapackManager 1
scoreboard players set VERSION$minecraft.current.minor DatapackManager 26
scoreboard players set VERSION$minecraft.current.patch DatapackManager 3
