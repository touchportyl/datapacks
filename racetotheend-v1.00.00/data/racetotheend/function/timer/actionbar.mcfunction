# Prepare leading zeros for minutes, seconds, and ticks
# A missing value will force the macro to abort the entire function so they are initialized with ""
# which will get ignored
data modify storage racetotheend:temp timer set value {minutesZero:"", secondsZero:"", ticksZero:""}
execute if score TIMER$minutes RaceToTheEnd matches 0..9 run data modify storage racetotheend:temp timer.minutesZero set value 0
execute if score TIMER$seconds RaceToTheEnd matches 0..9 run data modify storage racetotheend:temp timer.secondsZero set value 0
execute if score TIMER$ticks RaceToTheEnd matches 0..9 run data modify storage racetotheend:temp timer.ticksZero set value 0

# Load scoreboards into storage as well
execute store result storage racetotheend:temp timer.hours int 1 run scoreboard players get TIMER$hours RaceToTheEnd
execute store result storage racetotheend:temp timer.minutes int 1 run scoreboard players get TIMER$minutes RaceToTheEnd
execute store result storage racetotheend:temp timer.seconds int 1 run scoreboard players get TIMER$seconds RaceToTheEnd
execute store result storage racetotheend:temp timer.ticks int 1 run scoreboard players get TIMER$ticks RaceToTheEnd

# Display actionbar timer
function racetotheend:timer/actionbar_ with storage racetotheend:temp timer

# Cleanup
data remove storage racetotheend:temp timer