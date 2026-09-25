# 26.1 "Tiny Takeover" (2026-03-24). Stored as 1.26.1 = 12601, see check.mcfunction. Detection
# resolves to drop granularity: 26.1.1 and 26.1.2 add no new id and land here too.
execute if block ~ ~ ~ minecraft:golden_dandelion
scoreboard players set VERSION$minecraft.current       DatapackManager 12601
scoreboard players set VERSION$minecraft.current.major DatapackManager 1
scoreboard players set VERSION$minecraft.current.minor DatapackManager 26
scoreboard players set VERSION$minecraft.current.patch DatapackManager 1
