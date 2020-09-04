#> -----------------------------------------------
#> Harvester Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> update item
# this code hot swaps recently casted items before the player can pick it up


# irgol hoe
data merge entity @s[name="Golden Hoe"] {Item:{tag:{H_Harvester:1b,display:{Lore:['','{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Harvester","color":"dark_gray","italic":"false"}']}}}}

# obdiam hoe
data merge entity @s[name="Netherite Hoe"] {Item:{tag:{H_Harvester:1b,display:{Lore:['','{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Heated","color":"dark_gray","italic":"false"}','{"text":" ➥ Harvester","color":"dark_gray","italic":"false"}']}}}}


# advancement for obtaining a hoe above diamond/netherite level
execute as @a[distance=..5] run advancement grant @s only harvester:a_better_hoe


#> End of file
#> -----------
