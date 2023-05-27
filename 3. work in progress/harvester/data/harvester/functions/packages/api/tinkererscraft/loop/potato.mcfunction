#> -----------------------------------------------
#> Harvester Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> potato (references: ../packages/api/tinkererscraft/obdiam)
# this code controls the harvesting process


#> potato
execute at @e[tag=H_schedule_potato] run data merge entity @e[name="Potato",distance=..2,sort=nearest,limit=1] {Item:{id:"minecraft:baked_potato"}}


# loop
execute at @e[tag=H_schedule_potato] if entity @e[name="Potato",distance=..2] run schedule function harvester:packages/api/tinkererscraft/loop/potato 1t append

# break
execute at @e[tag=H_schedule_potato] unless entity @e[name="Potato",distance=..2] run tag @e[tag=H_schedule_potato] remove H_schedule_potato


#> End of file
#> -----------
