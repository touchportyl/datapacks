#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> override obsidian (references: ../modules/smelting/item_detection)
# this code overrides the ui system and skips to the obsidian display


# override other tags
tag @s remove TC_outputnull
tag @s remove TC_outputiron
tag @s remove TC_outputgold
tag @s remove TC_outputirgol
tag @s remove TC_outputobdiam

# display obsidian
tag @s add TC_outputobsidian

# update ui
function tinkererscraft:modules/smeltery/ui/update


#> End of file
#> -----------
