#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> ambient (references: ../main)
# this code adds particle effects and light to running smelteries


#fx:molten metal + structure light
setblock ^ ^ ^ minecraft:lava[level=1] replace

#pfx:lava
particle minecraft:lava ~ ~ ~ 0 0 0 0 1 normal

#pfx:ash
particle minecraft:ash ~ ~1 ~ 0.7 0.7 0.7 0 5 normal

#pfx:smoke
particle minecraft:smoke ~ ~-0.9 ~ 0.9 0 0.9 0 2 normal

#pfx:smog_large
particle minecraft:campfire_cosy_smoke ~ ~1 ~ 0 0 0 0.1 1 force

#pfx:smog_small
particle minecraft:large_smoke ~ ~1 ~ 0 0 0 0.1 1 normal


#> End of file
#> -----------
