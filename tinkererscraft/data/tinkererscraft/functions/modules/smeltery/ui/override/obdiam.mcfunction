#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> override obdiam (references: ../modules/smelting/reacting/obdiam)
# this code overrides the ui system and skips to the obdiam display


# override other tags
tag @s remove TC_outputnull
tag @s remove TC_outputcopper
tag @s remove TC_outputiron
tag @s remove TC_outputgold
tag @s remove TC_outputobsidian
tag @s remove TC_outputirgol

# display obdiam
tag @s add TC_outputobdiam

# update ui
function tinkererscraft:modules/smeltery/ui/update


#> End of file
#> -----------
