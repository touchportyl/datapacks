#> -----------------------------------------------
#> Dimensional Doors Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> door


execute if entity @s[tag=DD_NS] positioned ^ ^0.6 ^ if block ~ ~ ~ minecraft:oak_door[open=false] run particle minecraft:underwater ~ ~ ~ 0.12 0.11 0.02 0 70 force
execute if entity @s[tag=DD_NS] if block ~ ~ ~ minecraft:oak_door[open=true] run particle minecraft:underwater ~ ~ ~ 0.12 0.26 0.02 0 420 force
execute if entity @s[tag=DD_NS] if block ~ ~ ~ minecraft:oak_door[open=true] run particle minecraft:portal ~ ~ ~ 0.12 0.26 0.02 0.35 1 normal

execute if entity @s[tag=DD_EW] positioned ^ ^0.6 ^ if block ~ ~ ~ minecraft:oak_door[open=false] run particle minecraft:underwater ~ ~ ~ 0.02 0.11 0.12 0 70 force
execute if entity @s[tag=DD_EW] if block ~ ~ ~ minecraft:oak_door[open=true] run particle minecraft:underwater ~ ~ ~ 0.02 0.26 0.12 0 420 force
execute if entity @s[tag=DD_EW] if block ~ ~ ~ minecraft:oak_door[open=true] run particle minecraft:portal ~ ~ ~ 0.02 0.26 0.12 0.35 1 normal


#> End of file
#> -----------
