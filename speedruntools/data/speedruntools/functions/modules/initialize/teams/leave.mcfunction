#> -----------------------------------------------
#> Speedrun Tools Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> leave
# this removes teams from players to allow them to spectate


# join only if team is empty
execute run function speedruntools:modules/effects/ui/click
execute run team leave @s

# update bossbar
function speedruntools:modules/initialize/bossbar


#> End of file
#> -----------
