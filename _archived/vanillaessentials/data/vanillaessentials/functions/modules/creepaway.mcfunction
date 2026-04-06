#> -----------------------------------------------
#> Vanilla Essentials Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> creepaway
# go away you creeps


# face the creeper
tp @s ~ ~ ~ facing entity @e[type=creeper,distance=..50,sort=nearest,limit=1] eyes

# indicate the creeper got deleted
execute at @e[type=creeper,distance=..50,sort=nearest,limit=1] run particle reverse_portal ~ ~1 ~ 0.1 0.3 0.1 0.15 35 normal
execute if entity @e[type=creeper,distance=..50] run particle poof ~ ~1 ~ 0.1 0.3 0.1 0.1 2 normal

# delete creeper
tp @e[type=creeper,distance=..50,sort=nearest,limit=1] ~ -70 ~


#> End of file
#> -----------
