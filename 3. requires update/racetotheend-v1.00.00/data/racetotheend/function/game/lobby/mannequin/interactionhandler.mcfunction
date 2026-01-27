# detect interactions
execute as @n[tag=RE_lobby_mannequin_interaction,nbt={interaction:{}}] on target run function racetotheend:game/lobby/mannequin/interaction
execute as @n[tag=RE_lobby_mannequin_interaction,nbt={attack:{}}] on attacker run function racetotheend:game/lobby/mannequin/attack

# reset interactions
function racetotheend:game/lobby/mannequin/reset