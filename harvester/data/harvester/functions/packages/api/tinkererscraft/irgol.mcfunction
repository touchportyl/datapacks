#> -----------------------------------------------
#> Harvester Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> irgol (references: ../packages/api/tinkererscraft/positioner)
# this code controls the harvesting process


#> wheat
execute if block ~ ~1 ~ minecraft:wheat[age=7] run summon minecraft:item ~ ~1 ~ {Motion:[0.0,0.25,0.0],Item:{id:"minecraft:wheat",Count:1b},PickupDelay:10s}

#> potato
execute if block ~ ~1 ~ minecraft:potatoes[age=7] run summon minecraft:item ~ ~1 ~ {Motion:[0.0,0.25,0.0],Item:{id:"minecraft:potato",Count:1b},PickupDelay:10s}
execute if block ~ ~1 ~ minecraft:potatoes[age=7] run data merge entity @e[name="Poisonous Potato",distance=..1,sort=nearest,limit=1] {Item:{id:"minecraft:potato"}}

#> carrot
execute if block ~ ~1 ~ minecraft:carrots[age=7] run summon minecraft:item ~ ~1 ~ {Motion:[0.0,0.25,0.0],Item:{id:"minecraft:carrot",Count:1b},PickupDelay:10s}

#> beetroot
execute if block ~ ~1 ~ minecraft:beetroots[age=3] run summon minecraft:item ~ ~1 ~ {Motion:[0.0,0.25,0.0],Item:{id:"minecraft:beetroot",Count:1b},PickupDelay:10s}

#> netherwart
execute if entity @s[tag=H_api_3x3_netherwart] if block ~ ~1 ~ minecraft:nether_wart[age=3] run summon minecraft:item ~ ~1 ~ {Motion:[0.0,0.25,0.0],Item:{id:"minecraft:nether_wart",Count:1b},PickupDelay:10s}


#> End of file
#> -----------
