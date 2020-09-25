#> -----------------------------------------------
#> Harvester Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> obdiam (references: ../packages/api/tinkererscraft/positioner)
# this code controls the harvesting process


#> potato
execute if block ~ ~1 ~ minecraft:potatoes[age=7] run data merge entity @e[name="Poisonous Potato",distance=..1,sort=nearest,limit=1] {Item:{id:"minecraft:baked_potato"}}

execute if block ~ ~1 ~ minecraft:potatoes[age=7] run data merge entity @e[name="Potato",distance=..1,sort=nearest,limit=1] {Item:{id:"minecraft:baked_potato"}}
execute if block ~ ~1 ~ minecraft:potatoes[age=7] run data merge entity @e[name="Potato",distance=..1,sort=nearest,limit=1] {Item:{id:"minecraft:baked_potato"}}
execute if block ~ ~1 ~ minecraft:potatoes[age=7] run data merge entity @e[name="Potato",distance=..1,sort=nearest,limit=1] {Item:{id:"minecraft:baked_potato"}}

execute if block ~ ~1 ~ minecraft:potatoes[age=7] run summon minecraft:item ~ ~1 ~ {Motion:[0.0,0.25,0.0],Item:{id:"minecraft:potato",Count:1b},PickupDelay:10s}


#> End of file
#> -----------
