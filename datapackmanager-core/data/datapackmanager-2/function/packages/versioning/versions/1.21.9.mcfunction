# 1.21.10 added no new parseable registry id over 1.21.9, so they are
# runtime-indistinguishable and share this leaf. Do not gate on a hotfix level.
particle minecraft:copper_fire_flame ~ ~ ~ 0 0 0 0 1
scoreboard players set VERSION$minecraft.current       DatapackManager 12109
scoreboard players set VERSION$minecraft.current.major DatapackManager 1
scoreboard players set VERSION$minecraft.current.minor DatapackManager 21
scoreboard players set VERSION$minecraft.current.patch DatapackManager 9
