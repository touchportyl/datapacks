#> -----------------------------------------------
#> Harvester Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> inventory check
function harvester:modules/inventory/hoe
function harvester:modules/inventory/seeds

#> filter > positioner > controller
execute unless entity @s[tag=!H_wood,tag=!H_stone,tag=!H_gold,tag=!H_iron,tag=!H_diamond,tag=!H_netherite] run function harvester:modules/harvest/filter

#sfx:sweep
execute as @a[tag=H_success] at @s run function harvester:modules/effects/sweep


#> End of file
#> -----------
