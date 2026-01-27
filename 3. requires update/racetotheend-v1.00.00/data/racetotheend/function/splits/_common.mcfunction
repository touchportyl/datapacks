# Update split display
scoreboard players add @s RE_SplitCount 1

# Count the number of players who have reached this split
$scoreboard players add COUNT$players $(split) 1

# Record the time for this split
$scoreboard players operation @s $(split) = TIMER$total RaceToTheEnd