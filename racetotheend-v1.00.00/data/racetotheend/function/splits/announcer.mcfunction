# Calculate time for split
$execute store result storage racetotheend:temp announcer.input int 1 run scoreboard players get @s $(split)
function racetotheend:_packages/conversion/tickstotime {input_storage:"racetotheend:temp", input_path:"announcer.input", output_storage:"racetotheend:temp", output_path:"announcer"}

$execute if score COUNT$players $(split) matches 1 run data modify storage racetotheend:temp announcer.placement set value first
$execute if score COUNT$players $(split) matches 2 run data modify storage racetotheend:temp announcer.placement set value second
$execute if score COUNT$players $(split) matches 3 run data modify storage racetotheend:temp announcer.placement set value third

# Pass variables through
$data modify storage racetotheend:temp announcer.split set value $(split)
$data modify storage racetotheend:temp announcer.desc set value "$(desc)"
$data modify storage racetotheend:temp announcer.desc2 set value "$(desc2)"

# Announce
function racetotheend:splits/announcer_ with storage racetotheend:temp announcer

# Cleanup
data remove storage racetotheend:temp announcer