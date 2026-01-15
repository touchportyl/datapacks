# trigger death function if death detected
execute as @a at @s if score @s RE_DeathTrigger matches 1.. run function racetotheend:death/trigger


# wrapper to run death update for all players
execute as @a at @s if score @s RE_DeathTimer matches 1.. run function racetotheend:death/update_


# loop
schedule function racetotheend:death/update 1t