# calculate splits
function racetotheend:stats/processsplits {output_storage:"racetotheend:temp", output_path:"ranking"}

function racetotheend:game/podium/displaysplits_ with storage racetotheend:temp ranking

# Cleanup
data remove storage racetotheend:temp ranking