#> -----------------------------------------------
#> Dimensional Doors Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


# ran out of time, will be updating it in the future
execute if score $global.version TP_version matches 115 run function dimensionaldoors:old-1.15
execute if score $global.version TP_version matches 116 run function dimensionaldoors:old-1.16


#> conduit
#execute as @e[name=Conduit,nbt={OnGround:1b}] at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true] unless entity @e[tag=DD_portal,distance=..1] run function dimensionaldoors:modules/create/conduit


#> door detection
#execute as @e[tag=DD_portal] at @s run function dimensionaldoors:modules/door/detection/controller

#> door removal
#execute as @e[tag=DD_destroy] at @s run function dimensionaldoors:modules/door/remove

#> door particles
#execute as @e[tag=DD_portal] at @s positioned ^ ^1.1 ^0.425 run function dimensionaldoors:modules/effects/door

#> closer
#execute if score $global.version TP_version matches 115 as @e[tag=DD_portal,tag=DD_close] at @s run function dimensionaldoors:modules/door/closer/1.15
#execute if score $global.version TP_version matches 116 as @e[tag=DD_portal,tag=DD_close] at @s run function dimensionaldoors:modules/door/closer/1.16



#> End of file
#> -----------
