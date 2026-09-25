# 26.x releases use the year.drop numbering; they are stored as 1.<year>.<drop> so the encoding stays five digits and every "minor matches N.." gate stays monotonic
# hotfixes (26.1.1, 26.1.2) add no new ids, so they are not distinguishable from their drop
# probe: the golden dandelion block was added in 26.1
execute if block ~ ~ ~ minecraft:golden_dandelion
scoreboard players set VERSION$minecraft.current DatapackManager 12601
scoreboard players set VERSION$minecraft.current.major DatapackManager 1
scoreboard players set VERSION$minecraft.current.minor DatapackManager 26
scoreboard players set VERSION$minecraft.current.patch DatapackManager 1
