#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> drain (references: ../modules/casting/pouring/controller)
# this code acts as the filter for the draining timeline commands
# sorted by:
# - blocks
# - pressure plates
# - nuggets
# - ingots
# - tools


#> iron_block
execute as @s[tag=TC_outputiron,tag=TC_cauldron] at @s run function tinkererscraft:modules/casting/drain/iron_block

#> gold_block
execute as @s[tag=TC_outputgold,tag=TC_cauldron] at @s run function tinkererscraft:modules/casting/drain/gold_block

#> obsidian_block
execute as @s[tag=TC_outputobsidian,tag=TC_cauldron] at @s run function tinkererscraft:modules/casting/drain/obsidian_block


#> iron_pressureplate
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_pressureplate] at @s run function tinkererscraft:modules/casting/drain/iron_pressureplate

#> gold_pressureplate
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_pressureplate] at @s run function tinkererscraft:modules/casting/drain/gold_pressureplate


#> iron_nugget
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_nugget] at @s run function tinkererscraft:modules/casting/drain/iron_nugget

#> gold_nugget
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_nugget] at @s run function tinkererscraft:modules/casting/drain/gold_nugget


#> iron_ingot
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_ingot] at @s run function tinkererscraft:modules/casting/drain/iron_ingot

#> gold_ingot
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_ingot] at @s run function tinkererscraft:modules/casting/drain/gold_ingot


#> iron_pickaxe
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_pickaxe] at @s run function tinkererscraft:modules/casting/drain/iron_pickaxe

#> iron_sword
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_sword] at @s run function tinkererscraft:modules/casting/drain/iron_sword

#> iron_axe
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_axe] at @s run function tinkererscraft:modules/casting/drain/iron_axe

#> iron_shovel
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_shovel] at @s run function tinkererscraft:modules/casting/drain/iron_shovel

#> iron_hoe
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_hoe] at @s run function tinkererscraft:modules/casting/drain/iron_hoe


#> gold_pickaxe
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_pickaxe] at @s run function tinkererscraft:modules/casting/drain/gold_pickaxe

#> gold_sword
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_sword] at @s run function tinkererscraft:modules/casting/drain/gold_sword

#> gold_axe
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_axe] at @s run function tinkererscraft:modules/casting/drain/gold_axe

#> gold_shovel
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_shovel] at @s run function tinkererscraft:modules/casting/drain/gold_shovel

#> gold_hoe
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_hoe] at @s run function tinkererscraft:modules/casting/drain/gold_hoe


#> irgol_pickaxe
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_pickaxe] at @s run function tinkererscraft:modules/casting/drain/irgol_pickaxe

#> irgol_sword
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_sword] at @s run function tinkererscraft:modules/casting/drain/irgol_sword

#> irgol_axe
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_axe] at @s run function tinkererscraft:modules/casting/drain/irgol_axe

#> irgol_shovel
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_shovel] at @s run function tinkererscraft:modules/casting/drain/irgol_shovel

#> irgol_hoe
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_hoe] at @s run function tinkererscraft:modules/casting/drain/irgol_hoe


#> obdiam_pickaxe
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_pickaxe] at @s run function tinkererscraft:modules/casting/drain/obdiam_pickaxe

#> obdiam_sword
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_sword] at @s run function tinkererscraft:modules/casting/drain/obdiam_sword

#> obdiam_axe
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_axe] at @s run function tinkererscraft:modules/casting/drain/obdiam_axe

#> obdiam_shovel
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_shovel] at @s run function tinkererscraft:modules/casting/drain/obdiam_shovel

#> obdiam_hoe
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_hoe] at @s run function tinkererscraft:modules/casting/drain/obdiam_hoe


#> End of file
#> -----------
