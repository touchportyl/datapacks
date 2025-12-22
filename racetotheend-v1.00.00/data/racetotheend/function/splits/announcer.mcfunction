# Calculate time for split
$execute store result storage racetotheend:temp announcer.input int 1 run scoreboard players get @s $(split)
function racetotheend:_packages/conversion/tickstotime {input_storage:"racetotheend:temp", input_path:"announcer.input", output_storage:"racetotheend:temp", output_path:"announcer"}

$execute if score COUNT$players $(split) matches 1 run data modify storage racetotheend:temp announcer.placement set value "first"
$execute if score COUNT$players $(split) matches 2 run data modify storage racetotheend:temp announcer.placement set value "second"
$execute if score COUNT$players $(split) matches 3 run data modify storage racetotheend:temp announcer.placement set value "third"

# Use the points ranking system instead
$execute if score CONFIG$ranking.points matches 1 if score COUNT$players $(split) matches 1 run scoreboard players add @s RE_PointsRanking 4
$execute if score CONFIG$ranking.points matches 1 if score COUNT$players $(split) matches 2 run scoreboard players add @s RE_PointsRanking 3
$execute if score CONFIG$ranking.points matches 1 if score COUNT$players $(split) matches 3 run scoreboard players add @s RE_PointsRanking 2
$execute if score CONFIG$ranking.points matches 1 if score COUNT$players $(split) matches 4.. run scoreboard players add @s RE_PointsRanking 1

# Announce

# Congratulations! touchportyl is the first player to reach the nether with a time of 0h 0m 0s 00t!
$execute if score COUNT$players $(split) matches 1..3 run tellraw @a [{"text":" ","color":"white"},{"text":"Congratulations! ","color":"green"},{"selector":"@s","color":"gold"},{"text":" is the "},{"nbt":"announcer.placement","storage":"racetotheend:temp"},{"text":" player to $(desc) with a time of "},{"nbt":"announcer.hours","storage":"racetotheend:temp"},{"text":"h "},{"nbt":"announcer.minutesZero","storage":"racetotheend:temp"},{"nbt":"announcer.minutes","storage":"racetotheend:temp"},{"text":"m "},{"nbt":"announcer.secondsZero","storage":"racetotheend:temp"},{"nbt":"announcer.seconds","storage":"racetotheend:temp"},{"text":"s "},{"nbt":"announcer.ticksZero","storage":"racetotheend:temp","color":"gray"},{"nbt":"announcer.ticks","storage":"racetotheend:temp","color":"gray"},{"text":"t","color":"gray"},{"text":"!"}]
$execute if score COUNT$players $(split) matches 1..3 as @a at @s run function racetotheend:_packages/effects/split

# touchportyl has reached the nether at 0h 0m 0s 00t!
$execute if score COUNT$players $(split) matches 4.. run tellraw @a [{"text":" ","color":"white"},{"selector":"@s","color":"gold"},{"text":" has $(desc2) at "},{"nbt":"announcer.hours","storage":"racetotheend:temp"},{"text":"h "},{"nbt":"announcer.minutesZero","storage":"racetotheend:temp"},{"nbt":"announcer.minutes","storage":"racetotheend:temp"},{"text":"m "},{"nbt":"announcer.secondsZero","storage":"racetotheend:temp"},{"nbt":"announcer.seconds","storage":"racetotheend:temp"},{"text":"s "},{"nbt":"announcer.ticksZero","storage":"racetotheend:temp","color":"gray"},{"nbt":"announcer.ticks","storage":"racetotheend:temp","color":"gray"},{"text":"t","color":"gray"},{"text":"!"}]
$execute if score COUNT$players $(split) matches 4.. as @a at @s run function racetotheend:_packages/effects/split2

# Cleanup
data remove storage racetotheend:temp announcer