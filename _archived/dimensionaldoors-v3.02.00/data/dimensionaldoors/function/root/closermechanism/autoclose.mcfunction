# auto close doors that have been open for more than 5 seconds

# add if door is open
execute if block ~ ~ ~ #minecraft:doors[open=true,powered=false] run scoreboard players add @s DimensionalDoors 1

# tag close
execute if block ~ ~ ~ #minecraft:doors[open=true,powered=false] if score @s DimensionalDoors matches 5.. run tag @s add DD_close