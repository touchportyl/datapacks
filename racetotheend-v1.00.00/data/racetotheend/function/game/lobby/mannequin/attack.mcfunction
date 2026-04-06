execute if entity @a[tag=RE_lobby_mannequin_retaliation_target] run return fail 

# damage effect
damage @n[tag=RE_lobby_mannequin] 0 minecraft:generic

# track hits
scoreboard players add @s RE_NPCAnger 1

# random responses
execute if score @s RE_NPCAnger matches 11 store result score VAR$response RE_NPCAnger run random value 1..14
execute if score @s RE_NPCAnger matches 11 run function racetotheend:game/lobby/mannequin/responses/hit

# retaliate if angry enough
execute as @n[tag=RE_in_lobby] if score @s RE_NPCAnger matches 24.. run tag @s add RE_lobby_mannequin_retaliation_target
execute as @n[tag=RE_lobby_mannequin_retaliation_target] run scoreboard players set @s RE_NPCAnger 0
execute as @n[tag=RE_lobby_mannequin_retaliation_target] run function racetotheend:game/lobby/mannequin/retaliate