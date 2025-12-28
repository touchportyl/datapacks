# this starts the game for all players

# set time
time set 0

# grant starting advancement
advancement grant @a only racetotheend:splits/start

# restart timer
function racetotheend:timer/reset
function racetotheend:timer/start

# set game active
scoreboard players operation GAME$active RaceToTheEnd = BOOL$true RaceToTheEnd

# unlock all players
function racetotheend:playerlock/unlockall