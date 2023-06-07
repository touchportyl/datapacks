#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> item frame alignment (references: ../main)
# this code sets the rotation for the item frame on the anvil to face the correct direction


execute as @s[tag=TC_north] at @s positioned ^ ^ ^2 unless entity @e[type=minecraft:item_frame,distance=..0.2,nbt={ItemRotation:0b}] run data modify entity @e[type=minecraft:item_frame,distance=..0.2,sort=nearest,limit=1] ItemRotation set value 0

execute as @s[tag=TC_south] at @s positioned ^ ^ ^2 unless entity @e[type=minecraft:item_frame,distance=..0.2,nbt={ItemRotation:4b}] run data modify entity @e[type=minecraft:item_frame,distance=..0.2,sort=nearest,limit=1] ItemRotation set value 4

execute as @s[tag=TC_east] at @s positioned ^ ^ ^2 unless entity @e[type=minecraft:item_frame,distance=..0.2,nbt={ItemRotation:2b}] run data modify entity @e[type=minecraft:item_frame,distance=..0.2,sort=nearest,limit=1] ItemRotation set value 2

execute as @s[tag=TC_west] at @s positioned ^ ^ ^2 unless entity @e[type=minecraft:item_frame,distance=..0.2,nbt={ItemRotation:6b}] run data modify entity @e[type=minecraft:item_frame,distance=..0.2,sort=nearest,limit=1] ItemRotation set value 6


#todo:gc
tag @s remove TC_itemframenorth
tag @s remove TC_itemframesouth
tag @s remove TC_itemframeeast
tag @s remove TC_itemframewest


#> End of file
#> -----------
