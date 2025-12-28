execute if score VAR$countdown RaceToTheEnd < VAR$countdown.total RaceToTheEnd run title @a times 0t 21t 0t

# Respawning in 5...
execute if score VAR$countdown RaceToTheEnd matches 4.. run title @a subtitle [{"text":"","color":"white"},{"text":"Respawning in ","color":"white"},{"score":{"name":"VAR$countdown","objective":"RaceToTheEnd"},"color":"yellow"}]

execute if score VAR$countdown RaceToTheEnd matches 1..3 run title @a subtitle [{"text":"","color":"white"},{"text":"Respawning in ","color":"white"},{"score":{"name":"VAR$countdown","objective":"RaceToTheEnd"},"color":"red"}]

# You died!
execute if score VAR$countdown RaceToTheEnd matches 1.. run title @a title [{"text":"","color":"white"},{"text":"You died!","color":"red"}]

execute if score VAR$countdown RaceToTheEnd matches 0 run title @a times 0t 9t 10t
execute if score VAR$countdown RaceToTheEnd matches 0 run title @a title [{"text":"GO!","color":"green","bold":true}]
execute if score VAR$countdown RaceToTheEnd matches 0 run title @a subtitle [{"text":""}]
# reset title times for next use
# note: this is done in death/finish.mcfunction
#execute if score VAR$countdown RaceToTheEnd matches 0 run schedule function racetotheend:countdown/game/reset 1s

# countdown
scoreboard players remove VAR$countdown RaceToTheEnd 1
execute if score VAR$countdown RaceToTheEnd matches 0.. run schedule function racetotheend:countdown/death/ticker 1s