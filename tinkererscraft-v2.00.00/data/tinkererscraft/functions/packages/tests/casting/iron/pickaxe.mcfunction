#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> test


scoreboard players add $tc.iron.total TC_temp_tests 1

# garbage collection
execute at @e[tag=TC_temp_tests_smelting,sort=nearest,limit=1] as @e[type=item,distance=..3,sort=nearest,limit=1] if entity @s[nbt={Item:{tag:{TC_Casted:1b}}}] run kill @s

scoreboard players set @e[tag=TC_temp_tests_smelting] TC_lIron 3

# get the intended use amount for the bug checker
scoreboard players operation $tc.check.smeltery.amount TC_temp_tests = @e[tag=TC_temp_tests_smelting,sort=nearest,limit=1] TC_lIron

data merge entity @e[tag=TC_temp_tests_item_frame,sort=nearest,limit=1] {Item:{id:"minecraft:wooden_pickaxe",Count:1b}}

execute at @e[tag=TC_temp_tests_smelting] align xyz if block ~ ~ ~2 lever[facing=south,powered=false] run setblock ~ ~ ~2 lever[facing=south,powered=true] replace

# schedule next
schedule function tinkererscraft:packages/tests/casting/iron/pickaxe_ 62t


#> End of file
#> -----------
