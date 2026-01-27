# detect interactions
execute if entity @n[tag=RE_lobby_jukebox_interaction_stop,nbt={interaction:{}}] run function racetotheend:game/lobby/music/stop
execute if entity @n[tag=RE_lobby_jukebox_interaction_stop,nbt={attack:{}}] run function racetotheend:game/lobby/music/stop

execute if entity @n[tag=RE_lobby_jukebox_interaction_next,nbt={interaction:{}}] run function racetotheend:game/lobby/music/next
execute if entity @n[tag=RE_lobby_jukebox_interaction_next,nbt={attack:{}}] run function racetotheend:game/lobby/music/next

# feedback
execute as @n[tag=RE_lobby_jukebox_interaction_stop,nbt={interaction:{}}] at @s as @a[tag=RE_in_lobby] run function racetotheend:_packages/effects/notification
execute as @n[tag=RE_lobby_jukebox_interaction_stop,nbt={attack:{}}] at @s as @a[tag=RE_in_lobby] run function racetotheend:_packages/effects/notification

execute as @n[tag=RE_lobby_jukebox_interaction_next,nbt={interaction:{}}] at @s as @a[tag=RE_in_lobby] run function racetotheend:_packages/effects/notification
execute as @n[tag=RE_lobby_jukebox_interaction_next,nbt={attack:{}}] at @s as @a[tag=RE_in_lobby] run function racetotheend:_packages/effects/notification

# reset interactions
function racetotheend:game/lobby/jukebox/reset