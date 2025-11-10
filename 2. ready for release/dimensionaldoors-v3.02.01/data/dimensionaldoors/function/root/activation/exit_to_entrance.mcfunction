# teleport player: exit > entrance
execute as @e[tag=DD_exit] at @s at @e[tag=DD_enter-,distance=..2,limit=1] as @e[tag=DD_entrance] if score @s DD_doorID = @e[tag=DD_exit,limit=1,sort=nearest] DD_doorID run tp @e[tag=DD_enter-,distance=..2,limit=1,sort=nearest] @s


# 404 if teleport did not happen
execute as @e[tag=DD_exit] at @s at @e[tag=DD_enter-,distance=..2,limit=1] run tag @e[tag=DD_enter-,distance=..2,limit=1,sort=nearest] add DD_door404
execute as @e[tag=DD_door404] run tag @s remove DD_enter-