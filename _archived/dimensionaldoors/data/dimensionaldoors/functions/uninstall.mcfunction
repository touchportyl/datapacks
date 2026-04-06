#> -----------------------------------------------
#> Dimensional Doors Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> uninstall
# this code is the uninstallation confirmation message

tellraw @s [{"text":""},{"text":"\n\n\n ALERT","color":"dark_red","bold":"true"},{"text":"\n Uninstalling Dimensional Doors will remove all dimensional doors (without the explosion) and stops those chunks from loading. Re-installing Dimensional Doors will not make the doors come back.","color":"red"},{"text":"\n\n Are you sure that you want to uninstall Dimensional Doors?","color":"dark_red"},{"text":"\n "},{"text":"YES","color":"green","bold":"true","clickEvent":{"action":"run_command","value":"/function dimensionaldoors:packages/uninstall"}},{"text":" "},{"text":"NO","color":"red","bold":"true","clickEvent":{"action":"run_command","value":"/function dimensionaldoors:packages/uninstall_cancelled"}}]


#> End of file
#> -----------
