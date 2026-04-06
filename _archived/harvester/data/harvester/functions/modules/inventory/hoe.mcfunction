#> -----------------------------------------------
#> Harvester Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> hoe (references: ../main)
# this code assigns tags based on the player's selected items


execute if entity @s[nbt={SelectedItem:{id:"minecraft:wooden_hoe"}}] run tag @s add H_wood
execute if entity @s[nbt={SelectedItem:{id:"minecraft:stone_hoe"}}] run tag @s add H_stone

execute if entity @s[nbt={SelectedItem:{id:"minecraft:golden_hoe"}}] run tag @s add H_gold
execute if entity @s[nbt={SelectedItem:{id:"minecraft:iron_hoe"}}] run tag @s add H_iron

execute if entity @s[nbt={SelectedItem:{id:"minecraft:diamond_hoe"}}] run tag @s add H_diamond

execute if entity @s[nbt={SelectedItem:{id:"minecraft:netherite_hoe"}}] run tag @s add H_netherite


# classify
tag @a[tag=H_wood] add H_1x1
tag @a[tag=H_stone] add H_1x1
tag @a[tag=H_gold] add H_3x3_star
tag @a[tag=H_iron] add H_3x3_star
tag @a[tag=H_diamond] add H_3x3
tag @a[tag=H_netherite] add H_3x3_netherwart


#> End of file
#> -----------
