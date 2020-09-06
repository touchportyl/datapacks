#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> check (references: ../main)
# this code converts the setup in front of the smeltery into tags for the next segment of code


# cauldron detection
execute as @s at @s if block ^ ^-1 ^2 minecraft:cauldron run tag @s add TC_cauldron

# anvil detection
execute as @s at @s if block ^ ^-1 ^2 minecraft:anvil run tag @s add TC_anvil

#> check_anvil
execute as @e[tag=TC_anvil] at @s run function tinkererscraft:modules/smeltery/output/check_anvil


#> End of file
#> -----------
