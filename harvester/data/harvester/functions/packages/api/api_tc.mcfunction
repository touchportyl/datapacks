#> -----------------------------------------------
#> Harvester Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> api harvester
# this code allows harvester to work with Tinkerer's Craft


#> main
execute if entity @a[nbt={SelectedItem:{tag:{H_Harvester:1b}}}] if predicate harvester:player_checkers/is_sneaking run function harvester:main

#> update_item
execute as @e[tag=TC_casted,nbt={Item:{tag:{TC_Casted:1b,TC_Alloy:1b}}}] at @s run function harvester:packages/api/harvester/update_item







# remove existing tags
#execute as @e[tag=H_harvesting] run tag @s remove H_harvesting

# broadcast "if score TC_api_hash TC_api matches 101"
#execute as @a[nbt={SelectedItem:{id:"minecraft:golden_hoe",tag:{TC_Casted:1b,TC_Alloy:1b,TC_Harvester:1b}}}] at @s if score TC_api_hash TC_api matches 101 run tag @s add H_harvesting
#execute as @a[nbt={SelectedItem:{id:"minecraft:netherite_hoe",tag:{TC_Casted:1b,TC_Alloy:1b,TC_Harvester:1b}}}] at @s if score TC_api_hash TC_api matches 101 run tag @s add H_harvesting

# advancement for obdiam hoe
#execute as @e[tag=H_harvesting] at @s run advancement grant @s only tinkererscraft:tinkerers_craft/get_obdiam_hoe


#> End of file
#> -----------
