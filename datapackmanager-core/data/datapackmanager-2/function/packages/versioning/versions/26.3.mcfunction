# SENTINEL LEAF - 26.3 is NOT supported.
# It exists only so `current > forward` (forward = 260299) fires the too-new alert for an
# unsupported version. minecraft:red_shrub is SNAPSHOT-DERIVED (26.3 Snapshot 1, 2026-06-23)
# and may be renamed before release; if it is, this file fails to parse, drops silently, and
# detection falls back to 26.2 - the alert goes quiet but nothing breaks. Re-verify at 26.3 GA.
execute if block ~ ~ ~ minecraft:red_shrub
scoreboard players set VERSION$minecraft.current       DatapackManager 260300
scoreboard players set VERSION$minecraft.current.major DatapackManager 26
scoreboard players set VERSION$minecraft.current.minor DatapackManager 3
scoreboard players set VERSION$minecraft.current.patch DatapackManager 0
