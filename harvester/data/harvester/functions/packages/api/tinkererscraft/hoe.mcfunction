#> -----------------------------------------------
#> Harvester Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> hoe (references: ../api/tinkererscraft/main_tc)
# this code assigns tags based on the player's selected items


execute if entity @s[nbt={SelectedItem:{id:"minecraft:golden_hoe",tag:{H_Harvester:1b}}}] run tag @s add H_irgol
execute if entity @s[nbt={SelectedItem:{id:"minecraft:netherite_hoe",tag:{H_Harvester:1b}}}] run tag @s add H_obdiam


# classify
tag @a[tag=H_irgol] add H_api_3x3
tag @a[tag=H_obdiam] add H_api_3x3_netherwart

# remove bad tags
tag @a[tag=H_gold] remove H_gold
tag @a[tag=H_netherite] remove H_netherite


#> End of file
#> -----------
