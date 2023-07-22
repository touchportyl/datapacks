# turns items into scoreboard values

#> steps:
# reads the item count and saves it into a buffer
# multiplies the buffer to get the correct value
# adds the buffer into the actual storage


# get iron ore count and add to total iron
execute as @s at @s store result score @s TC_bIronOre run data get entity @e[tag=TC_ironore,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bIronOre=1..}] TC_bIronOre *= NUMBER$two DatapackManager
scoreboard players operation @s[scores={TC_bIronOre=1..}] TC_lIron += @s TC_bIronOre

# get gold ore count and add to total gold
execute as @s at @s store result score @s TC_bGoldOre run data get entity @e[tag=TC_goldore,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bGoldOre=1..}] TC_bGoldOre *= NUMBER$two DatapackManager
scoreboard players operation @s[scores={TC_bGoldOre=1..}] TC_lGold += @s TC_bGoldOre

# get nether gold ore count and add to total gold
execute as @s at @s store result score @s TC_bGoldOre run data get entity @e[tag=TC_nethergoldore,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bGoldOre=1..}] TC_bGoldOre *= NUMBER$two DatapackManager
scoreboard players operation @s[scores={TC_bGoldOre=1..}] TC_lGold += @s TC_bGoldOre

# get iron count and add to total iron
execute as @s at @s store result score @s TC_bIron run data get entity @e[tag=TC_iron,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bIron=1..}] TC_lIron += @s TC_bIron

# get gold count and add to total gold
execute as @s at @s store result score @s TC_bGold run data get entity @e[tag=TC_gold,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bGold=1..}] TC_lGold += @s TC_bGold

# get iron block count and add to total iron
execute as @s at @s store result score @s TC_bIronBlock run data get entity @e[tag=TC_ironblock,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bIronBlock=1..}] TC_bIronBlock *= NUMBER$nine DatapackManager
scoreboard players operation @s[scores={TC_bIronBlock=1..}] TC_lIron += @s TC_bIronBlock

# get gold block count and add to total gold
execute as @s at @s store result score @s TC_bGoldBlock run data get entity @e[tag=TC_goldblock,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bGoldBlock=1..}] TC_bGoldBlock *= NUMBER$nine DatapackManager
scoreboard players operation @s[scores={TC_bGoldBlock=1..}] TC_lGold += @s TC_bGoldBlock

# get obsidian count and add to total obsidian
execute as @s at @s store result score @s TC_bObsidian run data get entity @e[tag=TC_obsidian,distance=..2,sort=nearest,limit=1] Item.Count
scoreboard players operation @s[scores={TC_bObsidian=1..}] TC_lObsidian += @s TC_bObsidian


# change the display to show the most recently smelted metal
execute as @e[tag=TC_ironore] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:root/smeltery/ui/override/iron
execute as @e[tag=TC_goldore] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:root/smeltery/ui/override/gold
execute as @e[tag=TC_nethergoldore] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:root/smeltery/ui/override/gold
execute as @e[tag=TC_iron] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:root/smeltery/ui/override/iron
execute as @e[tag=TC_gold] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:root/smeltery/ui/override/gold
execute as @e[tag=TC_ironblock] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:root/smeltery/ui/override/iron
execute as @e[tag=TC_goldblock] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:root/smeltery/ui/override/gold
execute as @e[tag=TC_obsidian] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:root/smeltery/ui/override/obsidian


# update ui
function tinkererscraft:root/smeltery/ui/update


#> xp reward, double xp for ores
# smelt fx and cleanup happens here

execute if score @s TC_lIron < @s TC_lCapacity at @s as @e[tag=TC_ironore,distance=..2] run function tinkererscraft:effects/smelting/xp/value1
execute if score @s TC_lGold < @s TC_lCapacity at @s as @e[tag=TC_goldore,distance=..2] run function tinkererscraft:effects/smelting/xp/value1
execute if score @s TC_lGold < @s TC_lCapacity at @s as @e[tag=TC_nethergoldore,distance=..2] run function tinkererscraft:effects/smelting/xp/value1

execute if score @s TC_lIron < @s TC_lCapacity at @s as @e[tag=TC_iron,distance=..2] run function tinkererscraft:effects/smelting/xp/value0
execute if score @s TC_lGold < @s TC_lCapacity at @s as @e[tag=TC_gold,distance=..2] run function tinkererscraft:effects/smelting/xp/value0
execute if score @s TC_lIron < @s TC_lCapacity at @s as @e[tag=TC_ironblock,distance=..2] run function tinkererscraft:effects/smelting/xp/value0
execute if score @s TC_lGold < @s TC_lCapacity at @s as @e[tag=TC_goldblock,distance=..2] run function tinkererscraft:effects/smelting/xp/value0
execute if score @s TC_lObsidian < @s TC_lCapacity at @s as @e[tag=TC_obsidian,distance=..2] run function tinkererscraft:effects/smelting/xp/value0