# auto close doors that have been open for more than 5 seconds

# add if door is open
execute if block ~ ~ ~ minecraft:oak_door[open=true] run scoreboard players add @s DimensionalDoors 1

# tag close
execute if block ~ ~ ~ minecraft:oak_door[open=true] if score @s DimensionalDoors matches 5.. run tag @s add DD_close

# reset if closed
execute if block ~ ~ ~ minecraft:oak_door[open=false] run scoreboard players reset @s DimensionalDoors