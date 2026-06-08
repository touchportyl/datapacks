# guard
execute if score GAME$lobby RaceToTheEnd = BOOL$true RaceToTheEnd run return fail
execute if score GAME$active RaceToTheEnd = BOOL$false RaceToTheEnd run return fail
execute if score GAME$stopped RaceToTheEnd = BOOL$true RaceToTheEnd run return fail

# calculate splits
function racetotheend:stats/processsplits {output_storage:"racetotheend:temp", output_path:"splits"}

function racetotheend:stats/splits_ with storage racetotheend:temp splits

# Cleanup
data remove storage racetotheend:temp splits