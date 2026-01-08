execute if score VAR$countdown RaceToTheEnd < VAR$countdown.total RaceToTheEnd run title @s times 0t 21t 0t

# Respawning in 5...
execute if score VAR$countdown RaceToTheEnd matches 4.. run title @s subtitle [{"text":"","color":"white"},{"text":"Respawning in ","color":"white"},{"score":{"name":"VAR$countdown","objective":"RaceToTheEnd"},"color":"yellow"}]

execute if score VAR$countdown RaceToTheEnd matches 1..3 run title @s subtitle [{"text":"","color":"white"},{"text":"Respawning in ","color":"white"},{"score":{"name":"VAR$countdown","objective":"RaceToTheEnd"},"color":"red"}]

# You died!
execute if score VAR$countdown RaceToTheEnd matches 1.. run title @s title [{"text":"","color":"white"},{"text":"You died!","color":"red"}]

execute if score VAR$countdown RaceToTheEnd matches 0 run title @s times 0t 9t 10t
execute if score VAR$countdown RaceToTheEnd matches 0 run title @s title [{"text":"GO!","color":"green","bold":true}]
execute if score VAR$countdown RaceToTheEnd matches 0 run title @s subtitle [{"text":""}]
# reset title times for next use
# note: this is done in death/finish.mcfunction
#execute if score VAR$countdown RaceToTheEnd matches 0 run schedule function racetotheend:countdown/game/reset 1s

# countdown
# recalculates automatically based on RE_DeathTimer
#scoreboard players remove VAR$countdown RaceToTheEnd 1
#execute if score VAR$countdown RaceToTheEnd matches 0.. run schedule function racetotheend:countdown/death/ticker 1s