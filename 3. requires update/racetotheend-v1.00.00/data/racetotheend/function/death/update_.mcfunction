# handle countdown
execute if score @s RE_DeathTimer < VAR$respawntime RE_DeathTimer run title @s times 0t 21t 0t

# divide to get countdown in seconds
scoreboard players operation @s RE_DeathCountdown = @s RE_DeathTimer
scoreboard players operation @s RE_DeathCountdown /= CONST$ticksPerSecond RaceToTheEnd



# Respawning in 5...
execute if score @s RE_DeathCountdown matches 4.. run title @s subtitle [{"text":"","color":"white"},{"text":"Respawning in ","color":"white"},{"score":{"name":"@s","objective":"RE_DeathCountdown"},"color":"yellow"}]

execute if score @s RE_DeathCountdown matches 1..3 run title @s subtitle [{"text":"","color":"white"},{"text":"Respawning in ","color":"white"},{"score":{"name":"@s","objective":"RE_DeathCountdown"},"color":"red"}]

# You died!
execute if score @s RE_DeathCountdown matches 1.. run title @s title [{"text":"","color":"white"},{"text":"You died!","color":"red"}]

execute if score @s RE_DeathCountdown matches 0 run title @s times 0t 9t 10t
execute if score @s RE_DeathCountdown matches 0 run title @s title [{"text":"GO!","color":"green","bold":true}]
execute if score @s RE_DeathCountdown matches 0 run title @s subtitle [{"text":""}]
# reset title times for next use
# note: this is done in death/finish.mcfunction
#execute if score @s RE_DeathCountdown matches 0 run schedule function racetotheend:countdown/game/reset 1s


# finish respawning
execute if score @s RE_DeathTimer matches 1.. run scoreboard players remove @s RE_DeathTimer 1
execute if score @s RE_DeathTimer matches ..0 run function racetotheend:death/finish