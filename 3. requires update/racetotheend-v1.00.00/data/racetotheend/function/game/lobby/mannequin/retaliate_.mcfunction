# use anger as a timer to play the "animation"
scoreboard players add @s RE_NPCAnger 1

# pre-response
execute store result score VAR$response RE_NPCAnger run random value 1..12
execute if score @s RE_NPCAnger matches 5 run function racetotheend:game/lobby/mannequin/responses/preretaliate

# face attacker
execute as @n[tag=RE_lobby_mannequin] at @s run tp @s ~ ~ ~ facing entity @p[tag=RE_lobby_mannequin_retaliation_target] feet

# hold trident
execute if score @s RE_NPCAnger matches 30 as @n[tag=RE_lobby_mannequin] run item replace entity @s weapon.mainhand with minecraft:trident
execute if score @s RE_NPCAnger matches 30 at @n[tag=RE_lobby_mannequin] run playsound minecraft:ui.toast.out master @a ~ ~ ~ 1 1 0

# casting effects
execute if score @s RE_NPCAnger matches 30..80 at @n[tag=RE_lobby_mannequin] run particle minecraft:enchant ~ ~1 ~ 1 1 1 0.35 4 force @a[tag=RE_in_lobby]
execute if score @s RE_NPCAnger matches 40 at @n[tag=RE_lobby_mannequin] run playsound minecraft:block.conduit.activate master @a ~ ~ ~ 1 1 0
execute if score @s RE_NPCAnger matches 50 at @n[tag=RE_lobby_mannequin] run particle minecraft:witch ~ ~1 ~ 0.4 0.5 0.4 0.05 5 force @a[tag=RE_in_lobby]
execute if score @s RE_NPCAnger matches 70 at @n[tag=RE_lobby_mannequin] run particle minecraft:witch ~ ~1 ~ 0.4 0.5 0.4 0.05 10 force @a[tag=RE_in_lobby]
execute if score @s RE_NPCAnger matches 70 at @n[tag=RE_lobby_mannequin] run particle minecraft:soul_fire_flame ~ ~1 ~ 0.5 0.9 0.5 0 10 force @a[tag=RE_in_lobby]

# attack
execute if score @s RE_NPCAnger matches 80 as @n[tag=RE_lobby_mannequin] at @s run function racetotheend:_packages/effects/trident/throw
execute if score @s RE_NPCAnger matches 81 run function racetotheend:_packages/effects/trident/hit

# post-response (1/4 chance)
execute store result score VAR$response.chance RE_NPCAnger run random value 1..4
execute store result score VAR$response RE_NPCAnger run random value 1..11
execute if score @s RE_NPCAnger matches 120 if score VAR$response.chance RE_NPCAnger = BOOL$true RaceToTheEnd run function racetotheend:game/lobby/mannequin/responses/postretaliate

# keep trident
execute if score @s RE_NPCAnger matches 130 as @n[tag=RE_lobby_mannequin] run item replace entity @s weapon.mainhand with minecraft:air
execute if score @s RE_NPCAnger matches 130 at @n[tag=RE_lobby_mannequin] run playsound minecraft:ui.toast.out master @a ~ ~ ~ 1 1 0

# stop retaliating
execute if score @s RE_NPCAnger matches 140.. run tag @s remove RE_lobby_mannequin_retaliation_target
execute if score @s RE_NPCAnger matches 140.. run scoreboard players reset @s RE_NPCAnger