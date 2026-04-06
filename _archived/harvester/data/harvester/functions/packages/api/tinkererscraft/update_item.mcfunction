#> -----------------------------------------------
#> Harvester Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> update item
# this code hot swaps recently casted items before the player can pick it up


# irgol hoe
execute as @e[tag=TC_casted,nbt={Item:{tag:{TC_Casted:1b,TC_Alloy:1b}}}] at @s run data merge entity @s[name="Golden Hoe"] {Item:{tag:{H_Harvester:1b,display:{Lore:['','{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Prospector","color":"dark_gray","italic":"false"}','{"text":" ➥ Harvester","color":"dark_gray","italic":"false"}']}}}}

# obdiam hoe
execute as @e[tag=TC_casted,nbt={Item:{tag:{TC_Casted:1b,TC_Alloy:1b}}}] at @s run data merge entity @s[name="Netherite Hoe"] {Item:{tag:{H_Harvester:1b,display:{Lore:['','{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Heated","color":"dark_gray","italic":"false"}','{"text":" ➥ Harvester","color":"dark_gray","italic":"false"}']}}}}


# advancement for obtaining an alloy hoe with harvester
execute as @e[name="Golden Hoe",tag=TC_casted,nbt={Item:{tag:{TC_Casted:1b,TC_Alloy:1b}}}] at @s as @a[distance=..5] run advancement grant @s only harvester:a_better_harvester
execute as @e[name="Netherite Hoe",tag=TC_casted,nbt={Item:{tag:{TC_Casted:1b,TC_Alloy:1b}}}] at @s as @a[distance=..5] run advancement grant @s only harvester:a_better_harvester


# loop self
# name char limit     $-----------------------------
execute if score $h.version TP_version matches 20000 if score $api.tc.h TP_version matches 201 run schedule function harvester:packages/api/tinkererscraft/update_item 10t replace


#> End of file
#> -----------
