execute if score VAR$countdown RaceToTheEnd < VAR$countdown.total RaceToTheEnd run title @a times 0t 21t 0t

# Race starts in 10...
execute if score VAR$countdown RaceToTheEnd matches 4.. run title @a title [{"text":"","color":"white"},{"text":"Race starts in ","color":"white"},{"score":{"name":"VAR$countdown","objective":"RaceToTheEnd"},"color":"yellow"}]

execute if score VAR$countdown RaceToTheEnd matches 1..3 run title @a title [{"text":"","color":"white"},{"text":"Race starts in ","color":"white"},{"score":{"name":"VAR$countdown","objective":"RaceToTheEnd"},"color":"red"}]

execute if score VAR$countdown RaceToTheEnd matches 0 run title @a times 0t 9t 10t
execute if score VAR$countdown RaceToTheEnd matches 0 run title @a title [{"text":"GO!","color":"green","bold":true}]
# reset title times for next use
execute if score VAR$countdown RaceToTheEnd matches 0 run schedule function racetotheend:countdown/game/reset 1s

# countdown
scoreboard players remove VAR$countdown RaceToTheEnd 1
execute if score VAR$countdown RaceToTheEnd matches 0.. run schedule function racetotheend:countdown/game/ticker 1s replace