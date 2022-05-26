#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> reactants (references: ../modules/smelting/detection)
# this code tags items for reacting


# filter out reactants
execute as @e[tag=TC_redstone] at @s run tag @e[tag=TC_smeltery,scores={TC_lIron=2..,TC_lGold=3..,TC_lCapacity=512..},distance=..2] add TC_irgolreaction
execute as @e[tag=TC_diamond] at @s run tag @e[tag=TC_smeltery,scores={TC_lIrgol=3..,TC_lObsidian=8..,TC_lCapacity=768..},distance=..2] add TC_obdiamreaction

#todo:gc
execute as @e[tag=TC_irgolreaction] at @s run kill @e[tag=TC_redstone,distance=..2]
execute as @e[tag=TC_obdiamreaction] at @s run kill @e[tag=TC_diamond,distance=..2]


#> End of file
#> -----------
