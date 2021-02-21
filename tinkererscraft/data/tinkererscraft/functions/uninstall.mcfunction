#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> uninstall
# this code is the uninstallation confirmation message

tellraw @s [{"text":""},{"text":"\n\n\n ALERT","color":"dark_red","bold":"true"},{"text":"\n Tinkerer's Craft will remove (almost) everything related to it from your world. Make sure to empty your smelteries as liquid metals will not be refunded.","color":"red"},{"text":"\n\n Are you sure that you want to uninstall Tinkerer's Craft?","color":"dark_red"},{"text":"\n\n                           "},{"text":"[ Uninstall ]","color":"green","bold":"true","clickEvent":{"action":"run_command","value":"/function tinkererscraft:packages/uninstall"}},{"text":"\n\n"}]


#> End of file
#> -----------
