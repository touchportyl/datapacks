function racetotheend:playerlock/unlock
function racetotheend:countdown/reset
scoreboard players reset @s RE_DeathTimer

# set new health and food values
effect give @s minecraft:hunger 3 189 true
damage @s 20 minecraft:bad_respawn_point