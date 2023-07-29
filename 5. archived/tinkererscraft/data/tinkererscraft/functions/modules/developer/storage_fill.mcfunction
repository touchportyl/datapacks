#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> storage_fill (references: ../modules/smelting/item_detection)
# this is a dev command to fill the storage of a smeltery to capacity


# set values to max
scoreboard players set @s TC_lIron 4097
scoreboard players set @s TC_lGold 4097
scoreboard players set @s TC_lObsidian 4097
scoreboard players set @s TC_lIrgol 4097
scoreboard players set @s TC_lObdiam 4097

#sfx:activate
playsound minecraft:block.conduit.activate block @a ~ ~ ~ 1 2 0


#> End of file
#> -----------
