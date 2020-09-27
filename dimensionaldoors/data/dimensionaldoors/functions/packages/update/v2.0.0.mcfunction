#> -----------------------------------------------
#> Dimensional Doors Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> v2.0.0
# this code updates v1.3 to v2.0.0


# update version
scoreboard players set $DD.version TP_version 20000

# update msg
execute if DD_doorID.$current DD_doorID matches 1.. run tellraw @a [{"text":""},{"text":" -","color":"red"},{"text":" Cleaning up","color":"gray"},{"text":" [Dimensional Doors] ","color":"aqua"},{"text":"v1.3"}]


# port old values to new system
scoreboard objectives add DD_temp dummy [{"text":"Temporary Storage for Dimensional Doors","color":"red"}]

execute store result score $dd.doorID.current DD_temp run scoreboard players get DD_doorID.$current DD_doorID

scoreboard objectives remove DD_doorID
scoreboard objectives add DD_doorID dummy [{"text":"Dimensional Door ID","color":"light_purple"}]

execute store result score $dd.doorID.current DD_doorID run scoreboard players get DD_doorID.$current DD_temp

scoreboard objectives remove DD_temp


# cleanup
scoreboard objectives remove DD_init


# install current version
function dimensionaldoors:packages/install


#> End of file
#> -----------
