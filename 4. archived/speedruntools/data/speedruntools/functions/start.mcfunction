#> -----------------------------------------------
#> Speedrun Tools Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> start
# this starts the automated preparation phase before the actual speedrun
# this command should be run after teleporting to the [/locate stronghold] coordinates


# gamerule
gamerule sendCommandFeedback false
gamerule spectatorsGenerateChunks true

#> prepare
execute as @s at @s run function speedruntools:modules/game/start/prepare


#> End of file
#> -----------
