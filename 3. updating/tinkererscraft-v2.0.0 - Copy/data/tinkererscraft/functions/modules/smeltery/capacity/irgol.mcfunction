#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> irgol (references: ../modules/smeltery/capacity/limiter)
# this code enforces the storage limit for irgol


#sfx
function tinkererscraft:modules/effects/capacity/limit

# set to storage capacity
execute store result score @s TC_lIrgol run scoreboard players get @s TC_lCapacity

# update ui
function tinkererscraft:modules/smeltery/ui/update


#> End of file
#> -----------
