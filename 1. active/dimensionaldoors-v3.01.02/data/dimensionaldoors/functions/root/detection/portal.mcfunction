# portal detection

execute as @e[tag=DD_portal,tag=DD_left] at @s positioned ^0.5 ^0.2 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute as @e[tag=DD_portal,tag=DD_left] at @s positioned ^0.15 ^0.2 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute as @e[tag=DD_portal,tag=DD_left] at @s positioned ^0.5 ^0.45 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute as @e[tag=DD_portal,tag=DD_left] at @s positioned ^0.15 ^0.45 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute as @e[tag=DD_portal,tag=DD_left] at @s positioned ^0.5 ^0.7 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute as @e[tag=DD_portal,tag=DD_left] at @s positioned ^0.15 ^0.7 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute as @e[tag=DD_portal,tag=DD_left] at @s positioned ^0.5 ^0.95 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute as @e[tag=DD_portal,tag=DD_left] at @s positioned ^0.15 ^0.95 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute as @e[tag=DD_portal,tag=DD_left] at @s positioned ^0.5 ^1.2 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute as @e[tag=DD_portal,tag=DD_left] at @s positioned ^0.15 ^1.2 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter

execute as @e[tag=DD_portal,tag=DD_right] at @s positioned ^-0.5 ^0.2 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute as @e[tag=DD_portal,tag=DD_right] at @s positioned ^-0.15 ^0.2 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute as @e[tag=DD_portal,tag=DD_right] at @s positioned ^-0.5 ^0.45 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute as @e[tag=DD_portal,tag=DD_right] at @s positioned ^-0.15 ^0.45 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute as @e[tag=DD_portal,tag=DD_right] at @s positioned ^-0.5 ^0.7 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute as @e[tag=DD_portal,tag=DD_right] at @s positioned ^-0.15 ^0.7 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute as @e[tag=DD_portal,tag=DD_right] at @s positioned ^-0.5 ^0.95 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute as @e[tag=DD_portal,tag=DD_right] at @s positioned ^-0.15 ^0.95 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute as @e[tag=DD_portal,tag=DD_right] at @s positioned ^-0.5 ^1.2 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute as @e[tag=DD_portal,tag=DD_right] at @s positioned ^-0.15 ^1.2 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter



# success
execute as @e[tag=DD_enter] at @s run function dimensionaldoors:root/activation/main