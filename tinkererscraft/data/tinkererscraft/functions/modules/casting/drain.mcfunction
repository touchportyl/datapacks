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
execute as @s[tag=TC_outputiron,tag=TC_cauldron] at @s run function tinkererscraft:modules/casting/drain/iron/block

#> gold_block
execute as @s[tag=TC_outputgold,tag=TC_cauldron] at @s run function tinkererscraft:modules/casting/drain/gold/block

#> obsidian_block
execute as @s[tag=TC_outputobsidian,tag=TC_cauldron] at @s run function tinkererscraft:modules/casting/drain/obsidian/block


#> iron_pressureplate
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_pressureplate] at @s run function tinkererscraft:modules/casting/drain/iron/pressureplate

#> gold_pressureplate
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_pressureplate] at @s run function tinkererscraft:modules/casting/drain/gold/pressureplate


#> iron_nugget
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_nugget] at @s run function tinkererscraft:modules/casting/drain/iron/nugget

#> gold_nugget
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_nugget] at @s run function tinkererscraft:modules/casting/drain/gold/nugget


#> iron_ingot
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_ingot] at @s run function tinkererscraft:modules/casting/drain/iron/ingot

#> gold_ingot
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_ingot] at @s run function tinkererscraft:modules/casting/drain/gold/ingot


#> iron_pickaxe
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_pickaxe] at @s run function tinkererscraft:modules/casting/drain/iron/pickaxe

#> iron_sword
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_sword] at @s run function tinkererscraft:modules/casting/drain/iron/sword

#> iron_axe
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_axe] at @s run function tinkererscraft:modules/casting/drain/iron/axe

#> iron_shovel
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_shovel] at @s run function tinkererscraft:modules/casting/drain/iron/shovel

#> iron_hoe
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_hoe] at @s run function tinkererscraft:modules/casting/drain/iron/hoe


#> gold_pickaxe
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_pickaxe] at @s run function tinkererscraft:modules/casting/drain/gold/pickaxe

#> gold_sword
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_sword] at @s run function tinkererscraft:modules/casting/drain/gold/sword

#> gold_axe
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_axe] at @s run function tinkererscraft:modules/casting/drain/gold/axe

#> gold_shovel
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_shovel] at @s run function tinkererscraft:modules/casting/drain/gold/shovel

#> gold_hoe
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_hoe] at @s run function tinkererscraft:modules/casting/drain/gold/hoe


#> irgol_pickaxe
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_pickaxe] at @s run function tinkererscraft:modules/casting/drain/irgol/pickaxe

#> irgol_sword
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_sword] at @s run function tinkererscraft:modules/casting/drain/irgol/sword

#> irgol_axe
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_axe] at @s run function tinkererscraft:modules/casting/drain/irgol/axe

#> irgol_shovel
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_shovel] at @s run function tinkererscraft:modules/casting/drain/irgol/shovel

#> irgol_hoe
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_hoe] at @s run function tinkererscraft:modules/casting/drain/irgol/hoe


#> obdiam_pickaxe
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_pickaxe] at @s run function tinkererscraft:modules/casting/drain/obdiam/pickaxe

#> obdiam_sword
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_sword] at @s run function tinkererscraft:modules/casting/drain/obdiam/sword

#> obdiam_axe
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_axe] at @s run function tinkererscraft:modules/casting/drain/obdiam/axe

#> obdiam_shovel
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_shovel] at @s run function tinkererscraft:modules/casting/drain/obdiam/shovel

#> obdiam_hoe
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_hoe] at @s run function tinkererscraft:modules/casting/drain/obdiam/hoe


#> End of file
#> -----------
