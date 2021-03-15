#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> hazard (references: ../main)
# this code sets players on fire and removes entities near the casting area


#fire if jump on pouring metal
execute if entity @a[distance=..0.6] run summon minecraft:small_fireball ~ ~3 ~ {Motion:[0.0,-10.0,0.0]}

#remove items if pouring metal
# TODO: BUG FIX
# load order bug where the item would be killed after casting
#execute as @s[tag=TC_anvil] run data modify entity @e[type=minecraft:item,distance=..0.5,sort=random,limit=1] Fire set value 1000000

#execute as @s[tag=TC_cauldron] positioned ~ ~-1 ~ run data modify entity @e[type=minecraft:item,distance=..0.5,sort=random,limit=1] Fire set value 1000000


#> End of file
#> -----------
