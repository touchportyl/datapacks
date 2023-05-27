#> -----------------------------------------------
#> Harvester Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> tick
# this code is run by minecraft:tick


#> api
execute if score $h.version TP_version matches 20000 if score $api.tc.h TP_version matches 201 as @a at @s if predicate harvester:player_checkers/is_sneaking align xz positioned ~0.5 ~ ~0.5 run function harvester:packages/api/main_tc

#> main
execute if score $h.version TP_version matches 20000 as @a at @s if predicate harvester:player_checkers/is_sneaking align xz positioned ~0.5 ~ ~0.5 run function harvester:main


#> garbage collection
execute if score $h.version TP_version matches 20000 if score $api.tc.h TP_version matches 201 run function harvester:packages/api/tinkererscraft/garbage_collection
execute if score $h.version TP_version matches 20000 run function harvester:modules/garbage_collection


# randomiser
scoreboard players add $h.rand.4 H_rand 1
execute if score $h.rand.4 H_rand matches 4.. run scoreboard players set $h.rand.4 H_rand 1


#> End of file
#> -----------
