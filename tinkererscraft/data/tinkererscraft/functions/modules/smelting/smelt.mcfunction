#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> smelt (references: ../main)
# this code turns items into scoreboard values


# get copper ore count and add to total copper
execute as @s at @s store result score @s TC_bCopperOre run data get entity @e[tag=TC_copperore,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bCopperOre=1..}] TC_lCopper += @s TC_bCopperOre

# get iron ore count and add to total iron
execute as @s at @s store result score @s TC_bIronOre run data get entity @e[tag=TC_ironore,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bIronOre=1..}] TC_lIron += @s TC_bIronOre

# get iron ore count and add to total iron
execute as @s at @s store result score @s TC_bIronOre run data get entity @e[tag=TC_deepironore,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bIronOre=1..}] TC_bIronOre *= Two TC_NumberArray
scoreboard players operation @s[scores={TC_bIronOre=1..}] TC_lIron += @s TC_bIronOre

# get gold ore count and add to total gold
execute as @s at @s store result score @s TC_bGoldOre run data get entity @e[tag=TC_goldore,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bGoldOre=1..}] TC_lGold += @s TC_bGoldOre

# get gold ore count and add to total gold
execute as @s at @s store result score @s TC_bGoldOre run data get entity @e[tag=TC_deepgoldore,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bGoldOre=1..}] TC_bGoldOre *= Two TC_NumberArray
scoreboard players operation @s[scores={TC_bGoldOre=1..}] TC_lGold += @s TC_bGoldOre

# get nether gold ore count and add to total gold
execute as @s at @s store result score @s TC_bGoldOre run data get entity @e[tag=TC_nethergoldore,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bGoldOre=1..}] TC_lGold += @s TC_bGoldOre

# get copper count and add to total copper
execute as @s at @s store result score @s TC_bCopper run data get entity @e[tag=TC_copper,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bCopper=1..}] TC_lCopper += @s TC_bCopper

# get iron count and add to total iron
execute as @s at @s store result score @s TC_bIron run data get entity @e[tag=TC_iron,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bIron=1..}] TC_lIron += @s TC_bIron

# get gold count and add to total gold
execute as @s at @s store result score @s TC_bGold run data get entity @e[tag=TC_gold,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bGold=1..}] TC_lGold += @s TC_bGold

# get copper block count and add to total copper
execute as @s at @s store result score @s TC_bCopperBlock run data get entity @e[tag=TC_copperblock,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bCopperBlock=1..}] TC_bCopperBlock *= Nine TC_NumberArray
scoreboard players operation @s[scores={TC_bCopperBlock=1..}] TC_lIron += @s TC_bCopperBlock

# get iron block count and add to total iron
execute as @s at @s store result score @s TC_bIronBlock run data get entity @e[tag=TC_ironblock,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bIronBlock=1..}] TC_bIronBlock *= Nine TC_NumberArray
scoreboard players operation @s[scores={TC_bIronBlock=1..}] TC_lIron += @s TC_bIronBlock

# get gold block count and add to total gold
execute as @s at @s store result score @s TC_bGoldBlock run data get entity @e[tag=TC_goldblock,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bGoldBlock=1..}] TC_bGoldBlock *= Nine TC_NumberArray
scoreboard players operation @s[scores={TC_bGoldBlock=1..}] TC_lGold += @s TC_bGoldBlock

# get obsidian count and add to total obsidian
execute as @s at @s store result score @s TC_bObsidian run data get entity @e[tag=TC_obsidian,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bObsidian=1..}] TC_lObsidian += @s TC_bObsidian

#sfx:smelting
function tinkererscraft:modules/effects/smelting/smelt

# xp reward
execute if score @s TC_lIron < @s TC_lCapacity at @s as @e[tag=TC_ironore,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}
execute if score @s TC_lIron < @s TC_lCapacity at @s as @e[tag=TC_deepironore,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:1}
execute if score @s TC_lGold < @s TC_lCapacity at @s as @e[tag=TC_goldore,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}
execute if score @s TC_lGold < @s TC_lCapacity at @s as @e[tag=TC_deepgoldore,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:1}
execute if score @s TC_lGold < @s TC_lCapacity at @s as @e[tag=TC_nethergoldore,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:1}
execute if score @s TC_lIron < @s TC_lCapacity at @s as @e[tag=TC_iron,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}
execute if score @s TC_lGold < @s TC_lCapacity at @s as @e[tag=TC_gold,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}
execute if score @s TC_lIron < @s TC_lCapacity at @s as @e[tag=TC_ironblock,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}
execute if score @s TC_lGold < @s TC_lCapacity at @s as @e[tag=TC_goldblock,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}
execute if score @s TC_lObsidian < @s TC_lCapacity at @s as @e[tag=TC_obsidian,distance=..2] run summon experience_orb ~ ~2 ~ {Age:5960,Health:1,Value:0}

# update ui
function tinkererscraft:modules/smeltery/ui/update


#> End of file
#> -----------
