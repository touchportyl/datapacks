# guard
execute if score GAME$lobby RaceToTheEnd = BOOL$true RaceToTheEnd run return fail
execute if score GAME$active RaceToTheEnd = BOOL$false RaceToTheEnd run return fail
execute if score GAME$stopped RaceToTheEnd = BOOL$true RaceToTheEnd run return fail

data modify storage racetotheend:temp stats.game_state set value "idle"
data modify storage racetotheend:temp stats.game_state set value "lobby"
data modify storage racetotheend:temp stats.game_state set value "active"
data modify storage racetotheend:temp stats.game_state set value "podium"

# calculate splits
function racetotheend:stats/processsplits {output_storage:"racetotheend:temp", output_path:"stats"}

function racetotheend:stats/all_ with storage racetotheend:temp stats

# Cleanup
data remove storage racetotheend:temp stats