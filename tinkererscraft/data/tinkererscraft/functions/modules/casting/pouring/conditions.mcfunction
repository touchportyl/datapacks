#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> conditions (references: ../main)
# this code handles the smeltery's pouring conditions and halts pouring if necessary
# the stop condition for swapping ui is not included here (reference: ../modules/smeltery/ui/..)


# stop if null
execute as @s[tag=TC_outputnull] run tag @s add TC_stoppour

# stop if storage is empty
execute as @s[tag=TC_outputiron,scores={TC_lIron=-1}] run tag @s add TC_stoppour
execute as @s[tag=TC_outputgold,scores={TC_lGold=-1}] run tag @s add TC_stoppour
execute as @s[tag=TC_outputobsidian,scores={TC_lObsidian=-1}] run tag @s add TC_stoppour
execute as @s[tag=TC_outputirgol,scores={TC_lIrgol=-1}] run tag @s add TC_stoppour
execute as @s[tag=TC_outputobdiam,scores={TC_lObdiam=-1}] run tag @s add TC_stoppour

# stop if anvil is empty
execute as @s[tag=TC_anvil,tag=!TC_nugget,tag=!TC_ingot,tag=!TC_pickaxe,tag=!TC_sword,tag=!TC_axe,tag=!TC_shovel,tag=!TC_hoe,tag=!TC_pressureplate] run tag @s add TC_stoppour

# stop if no anvil or cauldron
execute as @s[tag=!TC_cauldron,tag=!TC_anvil] run tag @s add TC_stoppour

# stop if cast item doesn't exist
#todo: replace with break conditions
execute as @s[tag=TC_outputobsidian,tag=TC_anvil,tag=TC_nugget] run tag @s add TC_stoppour
execute as @s[tag=TC_outputobsidian,tag=TC_anvil,tag=TC_ingot] run tag @s add TC_stoppour
execute as @s[tag=TC_outputobsidian,tag=TC_anvil,tag=TC_pickaxe] run tag @s add TC_stoppour
execute as @s[tag=TC_outputobsidian,tag=TC_anvil,tag=TC_sword] run tag @s add TC_stoppour
execute as @s[tag=TC_outputobsidian,tag=TC_anvil,tag=TC_axe] run tag @s add TC_stoppour
execute as @s[tag=TC_outputobsidian,tag=TC_anvil,tag=TC_shovel] run tag @s add TC_stoppour
execute as @s[tag=TC_outputobsidian,tag=TC_anvil,tag=TC_hoe] run tag @s add TC_stoppour
execute as @s[tag=TC_outputobsidian,tag=TC_anvil,tag=TC_pressureplate] run tag @s add TC_stoppour

execute as @s[tag=TC_outputirgol,tag=TC_cauldron] run tag @s add TC_stoppour
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_nugget] run tag @s add TC_stoppour
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_ingot] run tag @s add TC_stoppour
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_pressureplate] run tag @s add TC_stoppour

execute as @s[tag=TC_outputobdiam,tag=TC_cauldron] run tag @s add TC_stoppour
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_nugget] run tag @s add TC_stoppour
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_ingot] run tag @s add TC_stoppour
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_pressureplate] run tag @s add TC_stoppour


#> stop
execute as @e[tag=TC_stoppour] at @s if block ^ ^ ^2 minecraft:lever[powered=true] run function tinkererscraft:modules/casting/stop


#> End of file
#> -----------
