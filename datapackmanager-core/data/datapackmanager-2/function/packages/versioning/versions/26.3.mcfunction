# 26.3 (2026-09-15). Stored as 1.26.3 = 12603. Newest supported version. There is no sentinel
# leaf above it yet because 26.4 Snapshot 1 added no new id, see check.mcfunction.
execute if block ~ ~ ~ minecraft:poplar_log
scoreboard players set VERSION$minecraft.current       DatapackManager 12603
scoreboard players set VERSION$minecraft.current.major DatapackManager 1
scoreboard players set VERSION$minecraft.current.minor DatapackManager 26
scoreboard players set VERSION$minecraft.current.patch DatapackManager 3
