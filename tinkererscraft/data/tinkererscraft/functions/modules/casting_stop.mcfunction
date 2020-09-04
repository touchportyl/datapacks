#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> casting stop
# this code resets the lever when the pouring is done


#sfx:clang
playsound minecraft:block.anvil.place block @a ^ ^ ^2 1 2 0

# reset lever
execute as @s at @s if block ^ ^ ^2 minecraft:lever[facing=north] run setblock ^ ^ ^2 minecraft:lever[facing=north,powered=false] replace
execute as @s at @s if block ^ ^ ^2 minecraft:lever[facing=south] run setblock ^ ^ ^2 minecraft:lever[facing=south,powered=false] replace
execute as @s at @s if block ^ ^ ^2 minecraft:lever[facing=east] run setblock ^ ^ ^2 minecraft:lever[facing=east,powered=false] replace
execute as @s at @s if block ^ ^ ^2 minecraft:lever[facing=west] run setblock ^ ^ ^2 minecraft:lever[facing=west,powered=false] replace


#> End of file
#> -----------
