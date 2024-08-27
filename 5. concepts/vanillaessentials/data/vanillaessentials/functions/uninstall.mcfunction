#> -----------------------------------------------
#> Vanilla Essentials Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> uninstall
# displays the uninstallation confirmation message

tellraw @s [{"text":""},{"text":"\n\n\n ALERT","color":"dark_red","bold":"true"},{"text":"\n Uninstalling Vanilla Essentials will remove the features it provides from your world.","color":"red"},{"text":"\n\n Are you sure that you want to uninstall Vanilla Essentials?","color":"dark_red"},{"text":"\n\n                           "},{"text":"[ Uninstall ]","color":"green","bold":"true","clickEvent":{"action":"run_command","value":"/function vanillaessentials:packages/uninstall"}},{"text":"\n\n"}]


#> End of file
#> -----------
