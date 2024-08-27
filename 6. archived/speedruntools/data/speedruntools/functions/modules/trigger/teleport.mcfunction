#> -----------------------------------------------
#> Speedrun Tools Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> trigger


execute if entity @a[team=blue] run scoreboard players enable @a blue
execute if entity @a[team=red] run scoreboard players enable @a red
execute if entity @a[team=green] run scoreboard players enable @a green
execute if entity @a[team=yellow] run scoreboard players enable @a yellow
execute if entity @a[team=purple] run scoreboard players enable @a purple
execute if entity @a[team=pink] run scoreboard players enable @a pink

execute as @a[scores={blue=1}] run tp @s @e[tag=ST_Blue_Split_1,limit=1]
execute as @a[scores={blue=2}] run tp @s @e[tag=ST_Blue_Split_2,limit=1]
execute as @a[scores={blue=3}] run tp @s @e[tag=ST_Blue_Split_3,limit=1]
execute as @a[scores={blue=4}] run tp @s @e[tag=ST_Blue_Split_4,limit=1]
execute as @a[scores={blue=5}] run tp @s @e[tag=ST_Blue_Split_5,limit=1]
execute as @a[scores={blue=6}] run tp @s @e[tag=ST_Blue_Split_6,limit=1]
execute as @a[scores={blue=6}] run tp @s @e[tag=ST_Blue_Split_7,limit=1]

execute as @a[scores={red=1}] run tp @s @e[tag=ST_Red_Split_1,limit=1]
execute as @a[scores={red=2}] run tp @s @e[tag=ST_Red_Split_2,limit=1]
execute as @a[scores={red=3}] run tp @s @e[tag=ST_Red_Split_3,limit=1]
execute as @a[scores={red=4}] run tp @s @e[tag=ST_Red_Split_4,limit=1]
execute as @a[scores={red=5}] run tp @s @e[tag=ST_Red_Split_5,limit=1]
execute as @a[scores={red=6}] run tp @s @e[tag=ST_Red_Split_6,limit=1]
execute as @a[scores={red=7}] run tp @s @e[tag=ST_Red_Split_7,limit=1]

execute as @a[scores={green=1}] run tp @s @e[tag=ST_Green_Split_1,limit=1]
execute as @a[scores={green=2}] run tp @s @e[tag=ST_Green_Split_2,limit=1]
execute as @a[scores={green=3}] run tp @s @e[tag=ST_Green_Split_3,limit=1]
execute as @a[scores={green=4}] run tp @s @e[tag=ST_Green_Split_4,limit=1]
execute as @a[scores={green=5}] run tp @s @e[tag=ST_Green_Split_5,limit=1]
execute as @a[scores={green=6}] run tp @s @e[tag=ST_Green_Split_6,limit=1]
execute as @a[scores={green=7}] run tp @s @e[tag=ST_Green_Split_7,limit=1]

execute as @a[scores={yellow=1}] run tp @s @e[tag=ST_Yellow_Split_1,limit=1]
execute as @a[scores={yellow=2}] run tp @s @e[tag=ST_Yellow_Split_2,limit=1]
execute as @a[scores={yellow=3}] run tp @s @e[tag=ST_Yellow_Split_3,limit=1]
execute as @a[scores={yellow=4}] run tp @s @e[tag=ST_Yellow_Split_4,limit=1]
execute as @a[scores={yellow=5}] run tp @s @e[tag=ST_Yellow_Split_5,limit=1]
execute as @a[scores={yellow=6}] run tp @s @e[tag=ST_Yellow_Split_6,limit=1]
execute as @a[scores={yellow=7}] run tp @s @e[tag=ST_Yellow_Split_7,limit=1]

execute as @a[scores={purple=1}] run tp @s @e[tag=ST_Purple_Split_1,limit=1]
execute as @a[scores={purple=2}] run tp @s @e[tag=ST_Purple_Split_2,limit=1]
execute as @a[scores={purple=3}] run tp @s @e[tag=ST_Purple_Split_3,limit=1]
execute as @a[scores={purple=4}] run tp @s @e[tag=ST_Purple_Split_4,limit=1]
execute as @a[scores={purple=5}] run tp @s @e[tag=ST_Purple_Split_5,limit=1]
execute as @a[scores={purple=6}] run tp @s @e[tag=ST_Purple_Split_6,limit=1]
execute as @a[scores={purple=7}] run tp @s @e[tag=ST_Purple_Split_7,limit=1]

execute as @a[scores={pink=1}] run tp @s @e[tag=ST_Pink_Split_1,limit=1]
execute as @a[scores={pink=2}] run tp @s @e[tag=ST_Pink_Split_2,limit=1]
execute as @a[scores={pink=3}] run tp @s @e[tag=ST_Pink_Split_3,limit=1]
execute as @a[scores={pink=4}] run tp @s @e[tag=ST_Pink_Split_4,limit=1]
execute as @a[scores={pink=5}] run tp @s @e[tag=ST_Pink_Split_5,limit=1]
execute as @a[scores={pink=6}] run tp @s @e[tag=ST_Pink_Split_6,limit=1]
execute as @a[scores={pink=7}] run tp @s @e[tag=ST_Pink_Split_7,limit=1]

execute as @a[scores={blue=1..}] run scoreboard players reset @s blue
execute as @a[scores={red=1..}] run scoreboard players reset @s red
execute as @a[scores={green=1..}] run scoreboard players reset @s green
execute as @a[scores={yellow=1..}] run scoreboard players reset @s yellow
execute as @a[scores={purple=1..}] run scoreboard players reset @s purple
execute as @a[scores={pink=1..}] run scoreboard players reset @s pink


#> End of file
#> -----------
