#> -----------------------------------------------
#> Dimensional Doors Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> remove
# this code runs when a door is marked for removal


# deactivate
function dimensionaldoors:modules/effects/destroy

# remove loaders
forceload remove ~ ~

# hard check if it's supposed to be loaded
execute at @e[tag=DD_portal,tag=!DD_destroy,distance=..32] run forceload add ~ ~

# blow up all with same ID
execute as @e[tag=DD_portal] at @s align xyz if score @s DD_doorID = @e[tag=DD_destroy,distance=0.5..,limit=1] DD_doorID run function dimensionaldoors:modules/door/remove

# kill door
kill @s


#> End of file
#> -----------
