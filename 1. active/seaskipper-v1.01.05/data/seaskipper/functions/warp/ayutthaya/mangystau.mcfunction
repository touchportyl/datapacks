# catch: ignore if not in the correct dialogue state
tag @s remove SS_ignore
execute unless score @s dialogueTracker matches 2 run tag @s add SS_ignore

# continue
scoreboard players set @s[tag=!SS_ignore] dialogueTracker 3

# teleport
tp @s[tag=!SS_ignore] -1882.5 63.5 964.5 180 5

# end
execute if entity @s[tag=!SS_ignore] run function seaskipper:npc/dialogue/seaskipper/end


# cleanup
tag @s remove SS_ignore