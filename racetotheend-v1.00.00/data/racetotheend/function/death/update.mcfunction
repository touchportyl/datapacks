# trigger death function if death detected
execute as @a at @s if score @s RE_DeathTrigger matches 1.. run function racetotheend:death/trigger

# finish respawning
execute as @a at @s if score @s RE_DeathTimer matches 1.. run scoreboard players remove @s RE_DeathTimer 1
execute as @a at @s if score @s RE_DeathTimer matches ..0 run function racetotheend:death/finish

# loop
schedule function racetotheend:death/update 1t