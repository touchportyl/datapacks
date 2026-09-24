# 26.1 "Tiny Takeover" (2026-03-24). Detection resolves to drop granularity:
# 26.1.1 and 26.1.2 also land here, hence patch 0.
execute if block ~ ~ ~ minecraft:golden_dandelion
scoreboard players set VERSION$minecraft.current       DatapackManager 260100
scoreboard players set VERSION$minecraft.current.major DatapackManager 26
scoreboard players set VERSION$minecraft.current.minor DatapackManager 1
scoreboard players set VERSION$minecraft.current.patch DatapackManager 0
