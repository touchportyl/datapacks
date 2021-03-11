#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> xp (references: ../modules/smelting/smelt)
# this code turns items into scoreboard values


# copper
execute if score @s TC_lCopper < @s TC_lCapacity at @s as @e[tag=TC_copperore,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}
execute if score @s TC_lCopper < @s TC_lCapacity at @s as @e[tag=TC_copper,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}
execute if score @s TC_lCopper < @s TC_lCapacity at @s as @e[tag=TC_copperblock,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}
execute if score @s TC_lCopper < @s TC_lCapacity at @s as @e[tag=TC_exposedcopperblock,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}
execute if score @s TC_lCopper < @s TC_lCapacity at @s as @e[tag=TC_weatheredcopperblock,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}
execute if score @s TC_lCopper < @s TC_lCapacity at @s as @e[tag=TC_oxidizedcopperblock,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}
execute if score @s TC_lCopper < @s TC_lCapacity at @s as @e[tag=TC_cutcopper,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}
execute if score @s TC_lCopper < @s TC_lCapacity at @s as @e[tag=TC_exposedcutcopper,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}
execute if score @s TC_lCopper < @s TC_lCapacity at @s as @e[tag=TC_weatheredcutcopper,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}
execute if score @s TC_lCopper < @s TC_lCapacity at @s as @e[tag=TC_oxidizedcutcopper,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}
execute if score @s TC_lCopper < @s TC_lCapacity at @s as @e[tag=TC_cutcopperstairs,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}
#execute if score @s TC_lCopper < @s TC_lCapacity at @s as @e[tag=TC_exposedcutcopperstairs,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}
#execute if score @s TC_lCopper < @s TC_lCapacity at @s as @e[tag=TC_weatheredcutcopperstairs,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}
#execute if score @s TC_lCopper < @s TC_lCapacity at @s as @e[tag=TC_oxidizedcutcopperstairs,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}
execute if score @s TC_lCopper < @s TC_lCapacity at @s as @e[tag=TC_cutcopperslab,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}
#execute if score @s TC_lCopper < @s TC_lCapacity at @s as @e[tag=TC_exposedcutcopperslab,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}
#execute if score @s TC_lCopper < @s TC_lCapacity at @s as @e[tag=TC_weatheredcutcopperslab,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}
#execute if score @s TC_lCopper < @s TC_lCapacity at @s as @e[tag=TC_oxidizedcutcopperslab,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}

# iron
execute if score @s TC_lIron < @s TC_lCapacity at @s as @e[tag=TC_ironore,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}
execute if score @s TC_lIron < @s TC_lCapacity at @s as @e[tag=TC_deepslateironore,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:1}
execute if score @s TC_lIron < @s TC_lCapacity at @s as @e[tag=TC_iron,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}
execute if score @s TC_lIron < @s TC_lCapacity at @s as @e[tag=TC_ironblock,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}

# gold
execute if score @s TC_lGold < @s TC_lCapacity at @s as @e[tag=TC_goldore,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}
execute if score @s TC_lGold < @s TC_lCapacity at @s as @e[tag=TC_deepslategoldore,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:1}
execute if score @s TC_lGold < @s TC_lCapacity at @s as @e[tag=TC_nethergoldore,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:1}
execute if score @s TC_lGold < @s TC_lCapacity at @s as @e[tag=TC_gold,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}
execute if score @s TC_lGold < @s TC_lCapacity at @s as @e[tag=TC_goldblock,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}

# obsidian
execute if score @s TC_lObsidian < @s TC_lCapacity at @s as @e[tag=TC_obsidian,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}


#> End of file
#> -----------
