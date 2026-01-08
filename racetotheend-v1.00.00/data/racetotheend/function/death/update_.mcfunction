# trigger death function if death detected
execute if score @s RE_DeathTrigger matches 1.. run function racetotheend:death/trigger


# handle countdown
execute if score @s RE_DeathTimer < VAR$respawntime RE_DeathTimer run title @a times 0t 21t 0t

# divide to get countdown in seconds
scoreboard players operation VAR$countdown RaceToTheEnd = @s RE_DeathTimer
scoreboard players operation VAR$countdown RaceToTheEnd /= CONST$tickspersecond RaceToTheEnd



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


# finish respawning
execute if score @s RE_DeathTimer matches 1.. run scoreboard players remove @s RE_DeathTimer 1
execute if score @s RE_DeathTimer matches ..0 run function racetotheend:death/finish

# loop
schedule function racetotheend:death/update 1t