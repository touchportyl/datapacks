execute as @a if score @s RE_lobby matches 1.. run function racetotheend:game/lobby/create
execute as @a if score @s RE_start matches 1.. run function racetotheend:game/start
execute as @a if score @s RE_stop matches 1.. run function racetotheend:game/stop
execute as @a if score @s RE_assist matches 1.. run function racetotheend:assist/toggle
execute as @a if score @s RE_stats matches 1.. run function racetotheend:stats/all
execute as @a if score @s RE_splits matches 1.. run function racetotheend:stats/splits

execute as @a run function racetotheend:commands/reset

# loop
schedule function racetotheend:commands/update 3t