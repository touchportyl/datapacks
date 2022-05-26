#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> run
# run this to test all versions of Tinkerer's Craft

# clear chat
tellraw @a {"text":"\n\n\n\n\n\n\n\n\n\n"}

# start test in 3s
tellraw @a [{"text":""},{"text":"\n\n\n ALERT","color":"dark_red","bold":"true","hoverEvent":{"action":"show_text","value":"Alert generated by Tinkerer's Craft"}},{"text":"\n Tinkerer's Craft will automatically run casting tests to check for compatibility. Do ","color":"red","hoverEvent":{"action":"show_text","value":"Alert generated by Tinkerer's Craft"}},{"text":"NOT","color":"red","bold":"true","underlined":"true","hoverEvent":{"action":"show_text","value":"Alert generated by Tinkerer's Craft"}},{"text":" close Minecraft, disable Tinkerer's Craft, or use any features provided by Tinkerer's Craft until the tests are complete.\n\n","color":"red","hoverEvent":{"action":"show_text","value":"Alert generated by Tinkerer's Craft"}}]

# tag player who ran the test
tag @s add TC_temp_tests_player


#> testing
# 3s reload buffer + 1s buffer

# setup
reload
schedule function tinkererscraft:packages/tests/casting/setup 4s


#> End of file
#> -----------
