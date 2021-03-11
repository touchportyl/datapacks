#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> parser (references: ../modules/smelting/detection)
# this code tags items for processing
#
# the list is sorted by type
# - copper
# - iron
# - gold
# - obdisian
# - reactants
# - developer items
# - upgrade items
# - others

# copper
execute as @s[name="Copper Ore"] run tag @s add TC_copperore
execute as @s[name="Copper Ingot"] run tag @s add TC_copper

execute as @s[name="Block of Copper"] run tag @s add TC_copperblock
execute as @s[name="Exposed Copper"] run tag @s add TC_exposedcopperblock
execute as @s[name="Weathered Copper"] run tag @s add TC_weatheredcopperblock
execute as @s[name="Oxidised Copper"] run tag @s add TC_oxidisedcopperblock
execute as @s[name="Waxed Block of Copper"] run tag @s add TC_copperblock
execute as @s[name="Waxed Exposed Copper"] run tag @s add TC_exposedcopperblock
execute as @s[name="Waxed Weathered Copper"] run tag @s add TC_weatheredcopperblock

execute as @s[name="Cut Copper"] run tag @s add TC_cutcopper
execute as @s[name="Exposed Cut Copper"] run tag @s add TC_exposedcutcopper
execute as @s[name="Weathered Cut Copper"] run tag @s add TC_weatheredcutcopper
execute as @s[name="Oxidised Cut Copper"] run tag @s add TC_oxidisedcutcopper
execute as @s[name="Waxed Cut Copper"] run tag @s add TC_cutcopper
execute as @s[name="Waxed Exposed Cut Copper"] run tag @s add TC_exposedcutcopper
execute as @s[name="Waxed Weathered Cut Copper"] run tag @s add TC_weatheredcutcopper

execute as @s[name="Cut Copper Stairs"] run tag @s add TC_cutcopperstairs
#execute as @s[name="Exposed Cut Copper Stairs"] run tag @s add TC_exposedcutcopperstairs
#execute as @s[name="Weathered Cut Copper Stairs"] run tag @s add TC_weatheredcutcopperstairs
#execute as @s[name="Oxidised Cut Copper Stairs"] run tag @s add TC_oxidisedcutcopperstairs
execute as @s[name="Waxed Cut Copper Stairs"] run tag @s add TC_cutcopperstairs
#execute as @s[name="Waxed Exposed Cut Copper Stairs"] run tag @s add TC_exposedcutcopperstairs
#execute as @s[name="Waxed Weathered Cut Copper Stairs"] run tag @s add TC_weatheredcutcopperstairs

execute as @s[name="Cut Copper Slab"] run tag @s add TC_cutcopperslab
#execute as @s[name="Exposed Cut Copper Slab"] run tag @s add TC_exposedcutcopperslab
#execute as @s[name="Weathered Cut Copper Slab"] run tag @s add TC_weatheredcutcopperslab
#execute as @s[name="Oxidised Cut Copper Slab"] run tag @s add TC_oxidisedcutcopperslab
execute as @s[name="Waxed Cut Copper Slab"] run tag @s add TC_cutcopperslab
#execute as @s[name="Waxed Exposed Cut Copper Slab"] run tag @s add TC_exposedcutcopperslab
#execute as @s[name="Waxed Weathered Cut Copper Slab"] run tag @s add TC_weatheredcutcopperslab

# iron
execute as @s[name="Iron Ore"] run tag @s add TC_ironore
execute as @s[name="Deepslate Iron Ore"] run tag @s add TC_deepslateironore
execute as @s[name="Iron Ingot"] run tag @s add TC_iron
execute as @s[name="Block of Iron"] run tag @s add TC_ironblock

# gold
execute as @s[name="Gold Ore"] run tag @s add TC_goldore
execute as @s[name="Deepslate Gold Ore"] run tag @s add TC_deepslategoldore
execute as @s[name="Nether Gold Ore"] run tag @s add TC_nethergoldore
execute as @s[name="Gold Ingot"] run tag @s add TC_gold
execute as @s[name="Block of Gold"] run tag @s add TC_goldblock

# obdisian
execute as @s[name="Obsidian"] run tag @s add TC_obsidian

# reactants
execute as @s[name="Redstone Dust"] run tag @s add TC_redstone
execute as @s[name="Diamond"] run tag @s add TC_diamond

# upgrade items
execute as @s[name="Block of Netherite"] run tag @s add TC_netheriteblock

# developer items
execute as @s[name="Command Block"] run tag @s add TC_commandblock


#> End of file
#> -----------
