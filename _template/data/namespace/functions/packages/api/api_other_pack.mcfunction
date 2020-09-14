#> -----------------------------------------------
#> <namespace> Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> api <namespace>
# this code allows <namespace> to work with <other_pack>


#> main
execute if entity @a[nbt={SelectedItem:{tag:{<other_pack>_<namespace>:1b}}}] run function <namespace>:main

#> <code>
execute as @e[tag=TC_casted,nbt={Item:{tag:{<other_pack>_Casted:1b,<other_pack>_Alloy:1b}}}] at @s run function <namespace>:packages/api/<namespace>/<code>


#> End of file
#> -----------
