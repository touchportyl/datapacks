#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> upgrade (references: ../modules/smelting/item_detection)
# this code controls the upgrade sequence


#> manually set to prevent overflow bugs
execute if score @s TC_lCapacity matches 3840 run advancement grant @a[distance=..7,sort=nearest,limit=1] only tinkererscraft:smeltery/capacity/upgrade_max
execute if score @s TC_lCapacity matches 3840 run scoreboard players set @s TC_lCapacity 4096
execute if score @s TC_lCapacity matches 3584 run scoreboard players set @s TC_lCapacity 3840
execute if score @s TC_lCapacity matches 3328 run scoreboard players set @s TC_lCapacity 3584
execute if score @s TC_lCapacity matches 3072 run scoreboard players set @s TC_lCapacity 3328
execute if score @s TC_lCapacity matches 2816 run scoreboard players set @s TC_lCapacity 3072
execute if score @s TC_lCapacity matches 2560 run scoreboard players set @s TC_lCapacity 2816
execute if score @s TC_lCapacity matches 2304 run scoreboard players set @s TC_lCapacity 2560
execute if score @s TC_lCapacity matches 2048 run scoreboard players set @s TC_lCapacity 2304
execute if score @s TC_lCapacity matches 1792 run scoreboard players set @s TC_lCapacity 2048
execute if score @s TC_lCapacity matches 1536 run scoreboard players set @s TC_lCapacity 1792
execute if score @s TC_lCapacity matches 1280 run scoreboard players set @s TC_lCapacity 1536
execute if score @s TC_lCapacity matches 1024 run scoreboard players set @s TC_lCapacity 1280
execute if score @s TC_lCapacity matches 768 run scoreboard players set @s TC_lCapacity 1024
execute if score @s TC_lCapacity matches 512 run scoreboard players set @s TC_lCapacity 768
execute if score @s TC_lCapacity matches 256 run scoreboard players set @s TC_lCapacity 512

#sfx:upgrade
execute if score @s TC_lCapacity matches 256..3840 run function tinkererscraft:modules/effects/capacity/upgrade

# advancement
execute if score @s TC_lCapacity matches 256..3840 run advancement grant @a[distance=..7,sort=nearest,limit=1] only tinkererscraft:smeltery/capacity/upgrade
execute if score @s TC_lCapacity matches 512 run advancement grant @a[distance=..7,sort=nearest,limit=1] until tinkererscraft:smelting/reacting/irgolupgrade
execute if score @s TC_lCapacity matches 768 run advancement grant @a[distance=..7,sort=nearest,limit=1] until tinkererscraft:smelting/reacting/obdiamupgrade


#> End of file
#> -----------
