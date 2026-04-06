#> -----------------------------------------------
#> Dimensional Doors Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> destroy


# deactivate
playsound minecraft:block.conduit.deactivate block @a ~ ~ ~ 1 1 0

# blow up
tag @s add DD_schedule_explode
schedule function dimensionaldoors:modules/effects/explode 20t append


#> End of file
#> -----------
