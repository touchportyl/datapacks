#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> controller (references: ../modules/smeltery/capacity/limiter)
# this code adds particle effects


#sfx:anvil
playsound minecraft:block.anvil.use block @a ~ ~ ~ 0.7 2 0

#sfx:ding
playsound minecraft:entity.player.levelup block @a ~ ~ ~ 1 0.3 0

#pfx:barrier
particle minecraft:flash ~ ~2.5 ~ 0 0 0 0 1 force


#> End of file
#> -----------
