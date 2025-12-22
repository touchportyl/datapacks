# Prepare leading zeros for minutes, seconds, and ticks
execute if score TIMER$minutes RaceToTheEnd matches 0..9 run data modify storage racetotheend:temp timer.minutesZero set value "0"
execute unless score TIMER$minutes RaceToTheEnd matches 0..9 run data modify storage racetotheend:temp timer.minutesZero set value ""
execute if score TIMER$seconds RaceToTheEnd matches 0..9 run data modify storage racetotheend:temp timer.secondsZero set value "0"
execute unless score TIMER$seconds RaceToTheEnd matches 0..9 run data modify storage racetotheend:temp timer.secondsZero set value ""
execute if score TIMER$ticks RaceToTheEnd matches 0..9 run data modify storage racetotheend:temp timer.ticksZero set value "0"
execute unless score TIMER$ticks RaceToTheEnd matches 0..9 run data modify storage racetotheend:temp timer.ticksZero set value ""

# Display actionbar timer
title @s actionbar [{"score":{"name":"TIMER$hours","objective":"RaceToTheEnd"}},{"text":"h "},{"nbt":"timer.minutesZero","storage":"racetotheend:temp"},{"score":{"name":"TIMER$minutes","objective":"RaceToTheEnd"}},{"text":"m "},{"nbt":"timer.secondsZero","storage":"racetotheend:temp"},{"score":{"name":"TIMER$seconds","objective":"RaceToTheEnd"}},{"text":"s "},{"nbt":"timer.ticksZero","storage":"racetotheend:temp","color":"gray"},{"score":{"name":"TIMER$ticks","objective":"RaceToTheEnd"},"color":"gray"},{"text":"t","color":"gray"}]

# Cleanup
data remove storage racetotheend:temp timer