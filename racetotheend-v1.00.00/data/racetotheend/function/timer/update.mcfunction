scoreboard players add TIMER$total RaceToTheEnd 1
scoreboard players add TIMER$ticks RaceToTheEnd 1

execute if score TIMER$ticks RaceToTheEnd matches 20.. run scoreboard players add TIMER$seconds RaceToTheEnd 1
execute if score TIMER$ticks RaceToTheEnd matches 20.. run scoreboard players set TIMER$ticks RaceToTheEnd 0

execute if score TIMER$seconds RaceToTheEnd matches 60.. run scoreboard players add TIMER$minutes RaceToTheEnd 1
execute if score TIMER$seconds RaceToTheEnd matches 60.. run scoreboard players set TIMER$seconds RaceToTheEnd 0

execute if score TIMER$minutes RaceToTheEnd matches 60.. run scoreboard players add TIMER$hours RaceToTheEnd 1
execute if score TIMER$minutes RaceToTheEnd matches 60.. run scoreboard players set TIMER$minutes RaceToTheEnd 0

execute if score GAME$active RaceToTheEnd matches 1 as @a run function racetotheend:timer/actionbar

schedule function racetotheend:timer/update 1t