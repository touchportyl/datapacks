function racetotheend:playerlock/unlock
function racetotheend:countdown/reset
scoreboard players reset @s RE_DeathTimer

# set new health and food values for regular players
execute as @s[tag=!RE_assist] run function racetotheend:death/effects

# grant effects for assist mode players
execute as @s[tag=RE_assist] run function racetotheend:assist/effects