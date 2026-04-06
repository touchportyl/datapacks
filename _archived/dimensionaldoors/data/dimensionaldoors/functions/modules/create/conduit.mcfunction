#> -----------------------------------------------
#> Dimensional Doors Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> conduit
# this tags the conduit if it is on the floor + in a door + not on portal marker

say conduit
# tag
execute align xyz positioned ~0.5 ~ ~0.5 run function dimensionaldoors:modules/create/door

tag @s[nbt={Item:{tag:{DD_Linked:1b}}}] add DD_linked


#> End of file
#> -----------
