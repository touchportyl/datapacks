# probe: the sulfur block was added in 26.2
execute if block ~ ~ ~ minecraft:sulfur
scoreboard players set VERSION$minecraft.current DatapackManager 12602
scoreboard players set VERSION$minecraft.current.major DatapackManager 1
scoreboard players set VERSION$minecraft.current.minor DatapackManager 26
scoreboard players set VERSION$minecraft.current.patch DatapackManager 2
