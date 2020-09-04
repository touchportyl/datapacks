#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> effects pouring global
# this code adds sound and particle effects to the start of the pouring


#sfx:clang
playsound minecraft:block.anvil.place block @a ^ ^ ^2 1 2 0

#sfx:pour
playsound minecraft:item.bucket.empty_lava block @a ^ ^ ^2 1 0 0

#pfx:lava
particle minecraft:lava ^ ^ ^2 0 0 0 0 5 normal


#> End of file
#> -----------
