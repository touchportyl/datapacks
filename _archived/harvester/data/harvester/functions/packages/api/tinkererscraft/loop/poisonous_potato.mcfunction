#> -----------------------------------------------
#> Harvester Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> poisonous potato (references: ../packages/api/tinkererscraft/obdiam)
# this code controls the harvesting process


#> potato
execute at @e[tag=H_schedule_poisonous_potato] run data merge entity @e[name="Poisonous Potato",distance=..2,sort=nearest,limit=1] {Item:{id:"minecraft:potato"}}


# loop
execute at @e[tag=H_schedule_poisonous_potato] if entity @e[name="Poisonous Potato",distance=..2] run schedule function harvester:packages/api/tinkererscraft/loop/poisonous_potato 1t append

# break
execute at @e[tag=H_schedule_poisonous_potato] unless entity @e[name="Poisonous Potato",distance=..2] run tag @e[tag=H_schedule_poisonous_potato] remove H_schedule_poisonous_potato


#> End of file
#> -----------
