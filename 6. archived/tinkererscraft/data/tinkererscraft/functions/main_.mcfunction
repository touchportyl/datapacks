#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> Global Item Giver

# /trigger give set <item_id>
# List of all item ids
#
# id 1: Tinkerer's Craft Guide Book
#
#
#
#
#
#

#execute as @a[scores={give=1}] run function tinkererscraft:advancements/tinkerers_craft



#reset giver
execute as @a[scores={give=1..}] run scoreboard players reset @s give


#> smeltee detection

execute as @e[type=minecraft:item,name="Iron Ore"] at @s if block ~ ~-1 ~ minecraft:gilded_blackstone run tag @s add TC_ironore
execute as @e[type=minecraft:item,name="Gold Ore"] at @s if block ~ ~-1 ~ minecraft:gilded_blackstone run tag @s add TC_goldore
execute as @e[type=minecraft:item,name="Nether Gold Ore"] at @s if block ~ ~-1 ~ minecraft:gilded_blackstone run tag @s add TC_nethergoldore
execute as @e[type=minecraft:item,name="Iron Ingot"] at @s if block ~ ~-1 ~ minecraft:gilded_blackstone run tag @s add TC_iron
execute as @e[type=minecraft:item,name="Gold Ingot"] at @s if block ~ ~-1 ~ minecraft:gilded_blackstone run tag @s add TC_gold
execute as @e[type=minecraft:item,name="Block of Iron"] at @s if block ~ ~-1 ~ minecraft:gilded_blackstone run tag @s add TC_ironblock
execute as @e[type=minecraft:item,name="Block of Gold"] at @s if block ~ ~-1 ~ minecraft:gilded_blackstone run tag @s add TC_goldblock
execute as @e[type=minecraft:item,name="Obsidian"] at @s if block ~ ~-1 ~ minecraft:gilded_blackstone run tag @s add TC_obsidian

execute as @e[type=minecraft:item,tag=TC_ironore] at @s run tag @s add TC_smeltee
execute as @e[type=minecraft:item,tag=TC_goldore] at @s run tag @s add TC_smeltee
execute as @e[type=minecraft:item,tag=TC_iron] at @s run tag @s add TC_smeltee
execute as @e[type=minecraft:item,tag=TC_gold] at @s run tag @s add TC_smeltee
execute as @e[type=minecraft:item,tag=TC_ironblock] at @s run tag @s add TC_smeltee
execute as @e[type=minecraft:item,tag=TC_goldblock] at @s run tag @s add TC_smeltee
execute as @e[type=minecraft:item,tag=TC_obsidian] at @s run tag @s add TC_smeltee


#> smelting detection

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s run tag @e[tag=TC_smeltee,distance=..2] add TC_smelting

execute as @e[tag=TC_smelting] run tag @s remove TC_smeltee


#> catalyst detection

execute as @e[type=minecraft:item,name="Redstone Dust"] at @s if block ~ ~-1 ~ minecraft:gilded_blackstone run tag @s add TC_redstone
execute as @e[type=minecraft:item,name="Diamond"] at @s if block ~ ~-1 ~ minecraft:gilded_blackstone run tag @s add TC_diamond


#> reacting check

execute as @e[type=minecraft:item,tag=TC_redstone] at @s run tag @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_lIron=2..,TC_lGold=3..},distance=..2] add TC_irgolreaction

execute as @e[type=minecraft:item,tag=TC_diamond] at @s run tag @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_lIron=9..,TC_lObsidian=2..},distance=..2] add TC_obdiamreaction

#remove item after reaction starts
execute as @e[tag=TC_irgolreaction] at @s run kill @e[tag=TC_redstone,distance=..2]
execute as @e[tag=TC_obdiamreaction] at @s run kill @e[tag=TC_diamond,distance=..2]


#> smeltery orientation and creation

#advancement on creation
execute as @e[type=minecraft:item,tag=TC_smeltee] at @s as @e[type=player,distance=..15,sort=nearest] run advancement grant @s until tinkererscraft:tinkerers_craft/build_smeltery

execute as @e[type=minecraft:item,tag=TC_smeltee] at @s align xyz if block ~1 ~-2 ~1 minecraft:lava if block ~1 ~-2 ~ minecraft:lava if block ~1 ~-2 ~-1 minecraft:lava if block ~ ~-2 ~1 minecraft:lava if block ~ ~-2 ~ minecraft:lava if block ~ ~-2 ~-1 minecraft:lava if block ~-1 ~-2 ~1 minecraft:lava if block ~-1 ~-2 ~ minecraft:lava if block ~-1 ~-2 ~-1 minecraft:lava if block ~1 ~-1 ~1 minecraft:polished_blackstone_bricks if block ~1 ~-1 ~ minecraft:polished_blackstone_bricks if block ~1 ~-1 ~-1 minecraft:polished_blackstone_bricks if block ~ ~-1 ~1 minecraft:polished_blackstone_bricks if block ~ ~-1 ~ minecraft:gilded_blackstone if block ~ ~-1 ~-1 minecraft:polished_blackstone_bricks if block ~-1 ~-1 ~1 minecraft:polished_blackstone_bricks if block ~-1 ~-1 ~ minecraft:polished_blackstone_bricks if block ~-1 ~-1 ~-1 minecraft:polished_blackstone_bricks if block ~1 ~ ~1 minecraft:polished_blackstone_bricks if block ~1 ~ ~ minecraft:polished_blackstone_bricks if block ~1 ~ ~-1 minecraft:polished_blackstone_bricks if block ~ ~ ~1 minecraft:chiseled_polished_blackstone if block ~ ~ ~ minecraft:air if block ~ ~ ~-1 minecraft:polished_blackstone_bricks if block ~-1 ~ ~1 minecraft:polished_blackstone_bricks if block ~-1 ~ ~ minecraft:polished_blackstone_bricks if block ~-1 ~ ~-1 minecraft:polished_blackstone_bricks if block ~1 ~1 ~1 minecraft:polished_blackstone_bricks if block ~1 ~1 ~ minecraft:polished_blackstone_bricks if block ~1 ~1 ~-1 minecraft:polished_blackstone_bricks if block ~ ~1 ~1 minecraft:black_stained_glass if block ~ ~1 ~ minecraft:air if block ~ ~1 ~-1 minecraft:polished_blackstone_bricks if block ~-1 ~1 ~1 minecraft:polished_blackstone_bricks if block ~-1 ~1 ~ minecraft:polished_blackstone_bricks if block ~-1 ~1 ~-1 minecraft:polished_blackstone_bricks if block ~1 ~2 ~1 minecraft:polished_blackstone_brick_slab if block ~1 ~2 ~ minecraft:polished_blackstone_brick_slab if block ~1 ~2 ~-1 minecraft:polished_blackstone_brick_slab if block ~ ~2 ~1 minecraft:polished_blackstone_brick_slab if block ~ ~2 ~ minecraft:air if block ~ ~2 ~-1 minecraft:polished_blackstone_brick_slab if block ~-1 ~2 ~1 minecraft:polished_blackstone_brick_slab if block ~-1 ~2 ~ minecraft:polished_blackstone_brick_slab if block ~-1 ~2 ~-1 minecraft:polished_blackstone_brick_slab if block ~ ~ ~2 minecraft:lever[face=wall,facing=south,powered=false] unless entity @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,distance=..15] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["TinkerersCraft","TC_smeltery","TC_north","TC_outputnull","TC_setzero"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

execute as @e[type=minecraft:item,tag=TC_smeltee] at @s align xyz if block ~1 ~-2 ~1 minecraft:lava if block ~1 ~-2 ~ minecraft:lava if block ~1 ~-2 ~-1 minecraft:lava if block ~ ~-2 ~1 minecraft:lava if block ~ ~-2 ~ minecraft:lava if block ~ ~-2 ~-1 minecraft:lava if block ~-1 ~-2 ~1 minecraft:lava if block ~-1 ~-2 ~ minecraft:lava if block ~-1 ~-2 ~-1 minecraft:lava if block ~1 ~-1 ~1 minecraft:polished_blackstone_bricks if block ~1 ~-1 ~ minecraft:polished_blackstone_bricks if block ~1 ~-1 ~-1 minecraft:polished_blackstone_bricks if block ~ ~-1 ~1 minecraft:polished_blackstone_bricks if block ~ ~-1 ~ minecraft:gilded_blackstone if block ~ ~-1 ~-1 minecraft:polished_blackstone_bricks if block ~-1 ~-1 ~1 minecraft:polished_blackstone_bricks if block ~-1 ~-1 ~ minecraft:polished_blackstone_bricks if block ~-1 ~-1 ~-1 minecraft:polished_blackstone_bricks if block ~1 ~ ~1 minecraft:polished_blackstone_bricks if block ~1 ~ ~ minecraft:polished_blackstone_bricks if block ~1 ~ ~-1 minecraft:polished_blackstone_bricks if block ~ ~ ~1 minecraft:polished_blackstone_bricks if block ~ ~ ~ minecraft:air if block ~ ~ ~-1 minecraft:chiseled_polished_blackstone if block ~-1 ~ ~1 minecraft:polished_blackstone_bricks if block ~-1 ~ ~ minecraft:polished_blackstone_bricks if block ~-1 ~ ~-1 minecraft:polished_blackstone_bricks if block ~1 ~1 ~1 minecraft:polished_blackstone_bricks if block ~1 ~1 ~ minecraft:polished_blackstone_bricks if block ~1 ~1 ~-1 minecraft:polished_blackstone_bricks if block ~ ~1 ~1 minecraft:polished_blackstone_bricks if block ~ ~1 ~ minecraft:air if block ~ ~1 ~-1 minecraft:black_stained_glass if block ~-1 ~1 ~1 minecraft:polished_blackstone_bricks if block ~-1 ~1 ~ minecraft:polished_blackstone_bricks if block ~-1 ~1 ~-1 minecraft:polished_blackstone_bricks if block ~1 ~2 ~1 minecraft:polished_blackstone_brick_slab if block ~1 ~2 ~ minecraft:polished_blackstone_brick_slab if block ~1 ~2 ~-1 minecraft:polished_blackstone_brick_slab if block ~ ~2 ~1 minecraft:polished_blackstone_brick_slab if block ~ ~2 ~ minecraft:air if block ~ ~2 ~-1 minecraft:polished_blackstone_brick_slab if block ~-1 ~2 ~1 minecraft:polished_blackstone_brick_slab if block ~-1 ~2 ~ minecraft:polished_blackstone_brick_slab if block ~-1 ~2 ~-1 minecraft:polished_blackstone_brick_slab if block ~ ~ ~-2 minecraft:lever[face=wall,facing=north,powered=false] unless entity @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,distance=..15] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["TinkerersCraft","TC_smeltery","TC_south","TC_outputnull","TC_setzero"],Rotation:[180f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

execute as @e[type=minecraft:item,tag=TC_smeltee] at @s align xyz if block ~1 ~-2 ~1 minecraft:lava if block ~1 ~-2 ~ minecraft:lava if block ~1 ~-2 ~-1 minecraft:lava if block ~ ~-2 ~1 minecraft:lava if block ~ ~-2 ~ minecraft:lava if block ~ ~-2 ~-1 minecraft:lava if block ~-1 ~-2 ~1 minecraft:lava if block ~-1 ~-2 ~ minecraft:lava if block ~-1 ~-2 ~-1 minecraft:lava if block ~1 ~-1 ~1 minecraft:polished_blackstone_bricks if block ~1 ~-1 ~ minecraft:polished_blackstone_bricks if block ~1 ~-1 ~-1 minecraft:polished_blackstone_bricks if block ~ ~-1 ~1 minecraft:polished_blackstone_bricks if block ~ ~-1 ~ minecraft:gilded_blackstone if block ~ ~-1 ~-1 minecraft:polished_blackstone_bricks if block ~-1 ~-1 ~1 minecraft:polished_blackstone_bricks if block ~-1 ~-1 ~ minecraft:polished_blackstone_bricks if block ~-1 ~-1 ~-1 minecraft:polished_blackstone_bricks if block ~1 ~ ~1 minecraft:polished_blackstone_bricks if block ~1 ~ ~ minecraft:polished_blackstone_bricks if block ~1 ~ ~-1 minecraft:polished_blackstone_bricks if block ~ ~ ~1 minecraft:polished_blackstone_bricks if block ~ ~ ~ minecraft:air if block ~ ~ ~-1 minecraft:polished_blackstone_bricks if block ~-1 ~ ~1 minecraft:polished_blackstone_bricks if block ~-1 ~ ~ minecraft:chiseled_polished_blackstone if block ~-1 ~ ~-1 minecraft:polished_blackstone_bricks if block ~1 ~1 ~1 minecraft:polished_blackstone_bricks if block ~1 ~1 ~ minecraft:polished_blackstone_bricks if block ~1 ~1 ~-1 minecraft:polished_blackstone_bricks if block ~ ~1 ~1 minecraft:polished_blackstone_bricks if block ~ ~1 ~ minecraft:air if block ~ ~1 ~-1 minecraft:polished_blackstone_bricks if block ~-1 ~1 ~1 minecraft:polished_blackstone_bricks if block ~-1 ~1 ~ minecraft:black_stained_glass if block ~-1 ~1 ~-1 minecraft:polished_blackstone_bricks if block ~1 ~2 ~1 minecraft:polished_blackstone_brick_slab if block ~1 ~2 ~ minecraft:polished_blackstone_brick_slab if block ~1 ~2 ~-1 minecraft:polished_blackstone_brick_slab if block ~ ~2 ~1 minecraft:polished_blackstone_brick_slab if block ~ ~2 ~ minecraft:air if block ~ ~2 ~-1 minecraft:polished_blackstone_brick_slab if block ~-1 ~2 ~1 minecraft:polished_blackstone_brick_slab if block ~-1 ~2 ~ minecraft:polished_blackstone_brick_slab if block ~-1 ~2 ~-1 minecraft:polished_blackstone_brick_slab if block ~-2 ~ ~ minecraft:lever[face=wall,facing=west,powered=false] unless entity @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,distance=..15] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["TinkerersCraft","TC_smeltery","TC_east","TC_outputnull","TC_setzero"],Rotation:[90f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

execute as @e[type=minecraft:item,tag=TC_smeltee] at @s align xyz if block ~1 ~-2 ~1 minecraft:lava if block ~1 ~-2 ~ minecraft:lava if block ~1 ~-2 ~-1 minecraft:lava if block ~ ~-2 ~1 minecraft:lava if block ~ ~-2 ~ minecraft:lava if block ~ ~-2 ~-1 minecraft:lava if block ~-1 ~-2 ~1 minecraft:lava if block ~-1 ~-2 ~ minecraft:lava if block ~-1 ~-2 ~-1 minecraft:lava if block ~1 ~-1 ~1 minecraft:polished_blackstone_bricks if block ~1 ~-1 ~ minecraft:polished_blackstone_bricks if block ~1 ~-1 ~-1 minecraft:polished_blackstone_bricks if block ~ ~-1 ~1 minecraft:polished_blackstone_bricks if block ~ ~-1 ~ minecraft:gilded_blackstone if block ~ ~-1 ~-1 minecraft:polished_blackstone_bricks if block ~-1 ~-1 ~1 minecraft:polished_blackstone_bricks if block ~-1 ~-1 ~ minecraft:polished_blackstone_bricks if block ~-1 ~-1 ~-1 minecraft:polished_blackstone_bricks if block ~1 ~ ~1 minecraft:polished_blackstone_bricks if block ~1 ~ ~ minecraft:chiseled_polished_blackstone if block ~1 ~ ~-1 minecraft:polished_blackstone_bricks if block ~ ~ ~1 minecraft:polished_blackstone_bricks if block ~ ~ ~ minecraft:air if block ~ ~ ~-1 minecraft:polished_blackstone_bricks if block ~-1 ~ ~1 minecraft:polished_blackstone_bricks if block ~-1 ~ ~ minecraft:polished_blackstone_bricks if block ~-1 ~ ~-1 minecraft:polished_blackstone_bricks if block ~1 ~1 ~1 minecraft:polished_blackstone_bricks if block ~1 ~1 ~ minecraft:black_stained_glass if block ~1 ~1 ~-1 minecraft:polished_blackstone_bricks if block ~ ~1 ~1 minecraft:polished_blackstone_bricks if block ~ ~1 ~ minecraft:air if block ~ ~1 ~-1 minecraft:polished_blackstone_bricks if block ~-1 ~1 ~1 minecraft:polished_blackstone_bricks if block ~-1 ~1 ~ minecraft:polished_blackstone_bricks if block ~-1 ~1 ~-1 minecraft:polished_blackstone_bricks if block ~1 ~2 ~1 minecraft:polished_blackstone_brick_slab if block ~1 ~2 ~ minecraft:polished_blackstone_brick_slab if block ~1 ~2 ~-1 minecraft:polished_blackstone_brick_slab if block ~ ~2 ~1 minecraft:polished_blackstone_brick_slab if block ~ ~2 ~ minecraft:air if block ~ ~2 ~-1 minecraft:polished_blackstone_brick_slab if block ~-1 ~2 ~1 minecraft:polished_blackstone_brick_slab if block ~-1 ~2 ~ minecraft:polished_blackstone_brick_slab if block ~-1 ~2 ~-1 minecraft:polished_blackstone_brick_slab if block ~2 ~ ~ minecraft:lever[face=wall,facing=east,powered=false] unless entity @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,distance=..15] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["TinkerersCraft","TC_smeltery","TC_west","TC_outputnull","TC_setzero"],Rotation:[270f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

#kill tag
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s run kill @e[type=minecraft:item,tag=TC_smeltee,distance=..1,limit=1]

#null remover
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_setzero] run scoreboard players set @s TC_lIron 0
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_setzero] run scoreboard players set @s TC_lGold 0
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_setzero] run scoreboard players set @s TC_lObsidian 0
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_setzero] run scoreboard players set @s TC_lIrgol 0
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_setzero] run scoreboard players set @s TC_lObdiam 0

#create display
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_setzero] at @s positioned ^ ^0.8 ^1 run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["TinkerersCraft","TC_display","TC_number"],CustomName:"{\"text\":\"Break\"}",CustomNameVisible:1b,Age:-2147483648,Duration:-1,WaitTime:-214748364,Particle:"minecraft:mycelium"}
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_setzero] at @s positioned ^ ^0.6 ^1 run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["TinkerersCraft","TC_display","TC_ore"],CustomName:"{\"text\":\"Glass\"}",CustomNameVisible:1b,Age:-2147483648,Duration:-1,WaitTime:-2147483648,Particle:"minecraft:mycelium"}

#clang sound
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_setzero] at @s run playsound minecraft:block.anvil.use block @a ~ ~ ~ 1 1.2 0

#remove setzero tag
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_setzero] run tag @s remove TC_setzero


#> smelting process

#get iron ore count and add to total iron
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s store result score @s TC_bIronOre run data get entity @e[tag=TC_ironore,distance=..2,sort=nearest,limit=1] Item.Count

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_bIronOre=1..}] run scoreboard players operation @s TC_bIronOre *= Two TC_NumberArray

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_bIronOre=1..}] run scoreboard players operation @s TC_lIron += @s TC_bIronOre


#get gold ore count and add to total gold
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s store result score @s TC_bGoldOre run data get entity @e[tag=TC_goldore,distance=..2,sort=nearest,limit=1] Item.Count

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_bGoldOre=1..}] run scoreboard players operation @s TC_bGoldOre *= Two TC_NumberArray

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_bGoldOre=1..}] run scoreboard players operation @s TC_lGold += @s TC_bGoldOre


#get nether gold ore count and add to total gold
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s store result score @s TC_bGoldOre run data get entity @e[tag=TC_nethergoldore,distance=..2,sort=nearest,limit=1] Item.Count

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_bGoldOre=1..}] run scoreboard players operation @s TC_bGoldOre *= Two TC_NumberArray

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_bGoldOre=1..}] run scoreboard players operation @s TC_lGold += @s TC_bGoldOre


#get iron count and add to total iron
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s store result score @s TC_bIron run data get entity @e[tag=TC_iron,distance=..2,sort=nearest,limit=1] Item.Count

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_bIron=1..}] run scoreboard players operation @s TC_lIron += @s TC_bIron


#get gold count and add to total gold
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s store result score @s TC_bGold run data get entity @e[tag=TC_gold,distance=..2,sort=nearest,limit=1] Item.Count

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_bGold=1..}] run scoreboard players operation @s TC_lGold += @s TC_bGold


#get iron block count and add to total iron
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s store result score @s TC_bIronBlock run data get entity @e[tag=TC_ironblock,distance=..2,sort=nearest,limit=1] Item.Count

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_bIronBlock=1..}] run scoreboard players operation @s TC_bIronBlock *= Nine TC_NumberArray

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_bIronBlock=1..}] run scoreboard players operation @s TC_lIron += @s TC_bIronBlock


#get gold block count and add to total gold
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s store result score @s TC_bGoldBlock run data get entity @e[tag=TC_goldblock,distance=..2,sort=nearest,limit=1] Item.Count

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_bGoldBlock=1..}] run scoreboard players operation @s TC_bGoldBlock *= Nine TC_NumberArray

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_bGoldBlock=1..}] run scoreboard players operation @s TC_lGold += @s TC_bGoldBlock


#get obsidian count and add to total obsidian
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s store result score @s TC_bObsidian run data get entity @e[tag=TC_obsidian,distance=..2,sort=nearest,limit=1] Item.Count

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_bObsidian=1..}] run scoreboard players operation @s TC_lObsidian += @s TC_bObsidian


#> reaction process

#irgol reaction
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_irgolreaction] run scoreboard players remove @s TC_lIron 2
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_irgolreaction] run scoreboard players remove @s TC_lGold 3
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_irgolreaction] run scoreboard players add @s TC_lIrgol 1

#odbiam reaction
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_obdiamreaction] run scoreboard players remove @s TC_lIron 9
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_obdiamreaction] run scoreboard players remove @s TC_lObsidian 2
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_obdiamreaction] run scoreboard players add @s TC_lObdiam 1

#reaction effects
execute as @e[tag=TC_irgolreaction] at @s run playsound minecraft:block.brewing_stand.brew block @a ~ ~ ~ 0.5 2 0
execute as @e[tag=TC_irgolreaction] at @s run particle minecraft:effect ~ ~2.5 ~ 0.2 0.1 0.2 0 10 force

execute as @e[tag=TC_obdiamreaction] at @s run playsound minecraft:block.brewing_stand.brew block @a ~ ~ ~ 0.5 2 0
execute as @e[tag=TC_obdiamreaction] at @s run particle minecraft:effect ~ ~2.5 ~ 0.2 0.1 0.2 0 10 force

#advancement on reaction
execute as @e[tag=TC_irgolreaction] at @s as @e[type=player,distance=..7,sort=nearest] run advancement grant @s until tinkererscraft:tinkerers_craft/make_irgol
execute as @e[tag=TC_obdiamreaction] at @s as @e[type=player,distance=..7,sort=nearest] run advancement grant @s until tinkererscraft:tinkerers_craft/make_obdiam

#remove tag
execute as @e[tag=TC_irgolreaction] at @s run tag @s remove TC_irgolreaction
execute as @e[tag=TC_obdiamreaction] at @s run tag @s remove TC_obdiamreaction


#> storage capacity

#sound cue that it's at capacity
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_lIron=4097..}] at @s run playsound minecraft:entity.generic.extinguish_fire block @a ~ ~ ~ 1 1 0
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_lGold=4097..}] at @s run playsound minecraft:entity.generic.extinguish_fire block @a ~ ~ ~ 1 1 0
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_lObsidian=4097..}] at @s run playsound minecraft:entity.generic.extinguish_fire block @a ~ ~ ~ 1 1 0
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_lIrgol=4097..}] at @s run playsound minecraft:entity.generic.extinguish_fire block @a ~ ~ ~ 1 1 0
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_lObdiam=4097..}] at @s run playsound minecraft:entity.generic.extinguish_fire block @a ~ ~ ~ 1 1 0

#visual cue that it's at capacity
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_lIron=4097..}] at @s run particle minecraft:barrier ~ ~2.5 ~ 0 0 0 0 1 force
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_lGold=4097..}] at @s run particle minecraft:barrier ~ ~2.5 ~ 0 0 0 0 1 force
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_lObsidian=4097..}] at @s run particle minecraft:barrier ~ ~2.5 ~ 0 0 0 0 1 force
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_lIrgol=4097..}] at @s run particle minecraft:barrier ~ ~2.5 ~ 0 0 0 0 1 force
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_lObdiam=4097..}] at @s run particle minecraft:barrier ~ ~2.5 ~ 0 0 0 0 1 force

#advancement on capacity
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_lIron=4097..}] at @s as @e[type=player,distance=..7,sort=nearest] run advancement grant @s only tinkererscraft:tinkerers_craft/reach_capacity
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_lGold=4097..}] at @s as @e[type=player,distance=..7,sort=nearest] run advancement grant @s only tinkererscraft:tinkerers_craft/reach_capacity
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_lObsidian=4097..}] at @s as @e[type=player,distance=..7,sort=nearest] run advancement grant @s only tinkererscraft:tinkerers_craft/reach_capacity
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_lIrgol=4097..}] at @s as @e[type=player,distance=..7,sort=nearest] run advancement grant @s only tinkererscraft:tinkerers_craft/reach_capacity
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_lObdiam=4097..}] at @s as @e[type=player,distance=..7,sort=nearest] run advancement grant @s only tinkererscraft:tinkerers_craft/reach_capacity

#advancement on full capacity
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_lIron=4096,TC_lGold=4096,TC_lObsidian=4096,TC_lIrgol=4096,TC_lObdiam=4096}] at @s as @e[type=player,distance=..7,sort=nearest] run advancement grant @s only tinkererscraft:tinkerers_craft/reach_full_capacity

#set to capacity
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_lIron=4097..}] at @s run scoreboard players set @s TC_lIron 4096
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_lGold=4097..}] at @s run scoreboard players set @s TC_lGold 4096
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_lObsidian=4097..}] at @s run scoreboard players set @s TC_lObsidian 4096
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_lIrgol=4097..}] at @s run scoreboard players set @s TC_lGold 4096
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_lObdiam=4097..}] at @s run scoreboard players set @s TC_lObsidian 4096


#smelting effects
execute as @e[tag=TC_smelting] at @s run playsound minecraft:block.lava.pop block @a ~ ~ ~ 0.5 0.5 0
execute as @e[tag=TC_smelting] at @s align xyz run particle minecraft:effect ~0.5 ~2 ~0.5 0.2 0.1 0.2 0 10 force


#kill tag
execute as @e[tag=TC_smelting] at @s run kill @s


#> smeltery removal

#if structure is messed with, remove smeltery (ignores lever, stained glass and lava)
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^1 ^-2 ^1 minecraft:lava run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^1 ^-2 ^ minecraft:lava run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^1 ^-2 ^-1 minecraft:lava run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^ ^-2 ^1 minecraft:lava run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^ ^-2 ^ minecraft:lava run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^ ^-2 ^-1 minecraft:lava run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^-1 ^-2 ^1 minecraft:lava run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^-1 ^-2 ^ minecraft:lava run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^-1 ^-2 ^-1 minecraft:lava run tag @s add TC_broken

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^1 ^-1 ^1 minecraft:polished_blackstone_bricks run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^1 ^-1 ^ minecraft:polished_blackstone_bricks run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^1 ^-1 ^-1 minecraft:polished_blackstone_bricks run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^ ^-1 ^1 minecraft:polished_blackstone_bricks run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^ ^-1 ^ minecraft:gilded_blackstone run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^ ^-1 ^-1 minecraft:polished_blackstone_bricks run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^-1 ^-1 ^1 minecraft:polished_blackstone_bricks run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^-1 ^-1 ^ minecraft:polished_blackstone_bricks run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^-1 ^-1 ^-1 minecraft:polished_blackstone_bricks run tag @s add TC_broken

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^1 ^ ^1 minecraft:polished_blackstone_bricks run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^1 ^ ^ minecraft:polished_blackstone_bricks run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^1 ^ ^-1 minecraft:polished_blackstone_bricks run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^ ^ ^1 minecraft:chiseled_polished_blackstone run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^ ^ ^-1 minecraft:polished_blackstone_bricks run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^-1 ^ ^1 minecraft:polished_blackstone_bricks run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^-1 ^ ^ minecraft:polished_blackstone_bricks run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^-1 ^ ^-1 minecraft:polished_blackstone_bricks run tag @s add TC_broken

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^1 ^1 ^1 minecraft:polished_blackstone_bricks run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^1 ^1 ^ minecraft:polished_blackstone_bricks run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^1 ^1 ^-1 minecraft:polished_blackstone_bricks run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^ ^1 ^ minecraft:air run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^ ^1 ^-1 minecraft:polished_blackstone_bricks run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^-1 ^1 ^1 minecraft:polished_blackstone_bricks run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^-1 ^1 ^ minecraft:polished_blackstone_bricks run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^-1 ^1 ^-1 minecraft:polished_blackstone_bricks run tag @s add TC_broken

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^1 ^2 ^1 minecraft:polished_blackstone_brick_slab run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^1 ^2 ^ minecraft:polished_blackstone_brick_slab run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^1 ^2 ^-1 minecraft:polished_blackstone_brick_slab run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^ ^2 ^1 minecraft:polished_blackstone_brick_slab run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^ ^2 ^ minecraft:air run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^ ^2 ^-1 minecraft:polished_blackstone_brick_slab run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^-1 ^2 ^1 minecraft:polished_blackstone_brick_slab run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^-1 ^2 ^ minecraft:polished_blackstone_brick_slab run tag @s add TC_broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s unless block ^-1 ^2 ^-1 minecraft:polished_blackstone_brick_slab run tag @s add TC_broken


#explode on break
execute as @e[type=minecraft:area_effect_cloud,tag=TC_broken] at @s run particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 1 force

execute as @e[type=minecraft:area_effect_cloud,tag=TC_broken] at @s run playsound minecraft:entity.generic.explode block @a ~ ~ ~ 1 1 0

execute as @e[type=minecraft:area_effect_cloud,tag=TC_broken] at @s run playsound minecraft:entity.firework_rocket.twinkle block @a ~ ~ ~ 1 1 0


#kill markers
execute as @e[type=minecraft:area_effect_cloud,tag=TC_broken] at @s positioned ^ ^1 ^1 run kill @e[type=minecraft:area_effect_cloud,tag=TC_display,distance=..1]

execute as @e[type=minecraft:area_effect_cloud,tag=TC_broken] run kill @s


#> smeltery ui

#if break glass switch display - tutorial to iron
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputnull] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputiron

#replace glass when broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputnull] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run setblock ^ ^1 ^1 minecraft:black_stained_glass replace

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputiron] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s remove TC_outputnull


#if break glass switch display - iron to gold
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputiron] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputgold

#force stop condition if swapping
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_OutputTimer=1..}] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_stoppour

#replace glass when broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputiron] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run setblock ^ ^1 ^1 minecraft:black_stained_glass replace

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputgold] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s remove TC_outputiron


#if break glass switch display - gold to obsidian
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputgold] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputobsidian

#force stop condition if swapping
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_OutputTimer=1..}] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_stoppour

#replace glass when broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputgold] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run setblock ^ ^1 ^1 minecraft:black_stained_glass replace

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputobsidian] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s remove TC_outputgold


#if break glass switch display - obsidian to irgol
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputobsidian] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputirgol

#force stop condition if swapping
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_OutputTimer=1..}] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_stoppour

#replace glass when broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputobsidian] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run setblock ^ ^1 ^1 minecraft:black_stained_glass replace

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputirgol] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s remove TC_outputobsidian


#if break glass switch display - irgol to obdiam
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputirgol] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputobdiam

#force stop condition if swapping
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_OutputTimer=1..}] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_stoppour

#replace glass when broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputirgol] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run setblock ^ ^1 ^1 minecraft:black_stained_glass replace

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputobdiam] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s remove TC_outputirgol


#if break glass switch display - obdiam to iron
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputobdiam] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputiron

#force stop condition if swapping
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_OutputTimer=1..}] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_stoppour

#replace glass when broken
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputobdiam] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run setblock ^ ^1 ^1 minecraft:black_stained_glass replace

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputiron] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s remove TC_outputobdiam


#delete glass item if silk touch
execute as @e[type=minecraft:area_effect_cloud,tag=TC_display] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run kill @e[type=minecraft:item,name="Black Stained Glass",distance=..1]


#swap ore displays
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputiron] at @s positioned ^ ^0.6 ^1 run data modify entity @e[type=minecraft:area_effect_cloud,tag=TC_display,tag=TC_ore,distance=..1,limit=1] CustomName set value '{"text":"Iron","color":"gray"}'

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputgold] at @s positioned ^ ^0.6 ^1 run data modify entity @e[type=minecraft:area_effect_cloud,tag=TC_display,tag=TC_ore,distance=..1,limit=1] CustomName set value '{"text":"Gold","color":"yellow"}'

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputobsidian] at @s positioned ^ ^0.6 ^1 run data modify entity @e[type=minecraft:area_effect_cloud,tag=TC_display,tag=TC_ore,distance=..1,limit=1] CustomName set value '{"text":"Obsidian","color":"dark_gray"}'

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputirgol] at @s positioned ^ ^0.6 ^1 run data modify entity @e[type=minecraft:area_effect_cloud,tag=TC_display,tag=TC_ore,distance=..1,limit=1] CustomName set value '{"text":"Irgol","color":"gold"}'

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputobdiam] at @s positioned ^ ^0.6 ^1 run data modify entity @e[type=minecraft:area_effect_cloud,tag=TC_display,tag=TC_ore,distance=..1,limit=1] CustomName set value '{"text":"Obdiam","color":"dark_red"}'


#> update ui number

#place sign (text parser)
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s run setblock ^ ^1 ^2 minecraft:oak_sign replace

#parse scoreboard on sign Text1
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputiron] at @s run data modify block ^ ^1 ^2 Text1 set value '{"score":{"name":"@e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputiron,distance=..4,limit=1]","objective":"TC_lIron"}}'

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputgold] at @s run data modify block ^ ^1 ^2 Text1 set value '{"score":{"name":"@e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputgold,distance=..4,limit=1]","objective":"TC_lGold"}}'

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputobsidian] at @s run data modify block ^ ^1 ^2 Text1 set value '{"score":{"name":"@e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputobsidian,distance=..4,limit=1]","objective":"TC_lObsidian"}}'

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputirgol] at @s run data modify block ^ ^1 ^2 Text1 set value '{"score":{"name":"@e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputirgol,distance=..4,limit=1]","objective":"TC_lIrgol"}}'

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputobdiam] at @s run data modify block ^ ^1 ^2 Text1 set value '{"score":{"name":"@e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputobdiam,distance=..4,limit=1]","objective":"TC_lObdiam"}}'


#transfer parsed text into custom name
execute as @e[type=minecraft:area_effect_cloud,tag=!TC_outputnull,tag=TC_smeltery] at @s run data modify entity @e[type=minecraft:area_effect_cloud,tag=TC_display,tag=TC_number,distance=..2,limit=1] CustomName set from block ^ ^1 ^2 Text1

#remove sign
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s run setblock ^ ^1 ^2 minecraft:air replace


#> ambient effects

#molten metal + structure light
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s run setblock ^ ^ ^ minecraft:lava[level=1] replace

#lava pop
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s run particle minecraft:lava ~ ~ ~ 0 0 0 0 1 normal

#brick ash
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s run particle minecraft:ash ~ ~1 ~ 0.7 0.7 0.7 0 5 normal

#ground heat smoke
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s run particle minecraft:smoke ~ ~-0.9 ~ 0.9 0 0.9 0 2 normal

#large smog
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s run particle minecraft:campfire_cosy_smoke ~ ~1 ~ 0 0 0 0.1 1 force

#small smog
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s run particle minecraft:large_smoke ~ ~1 ~ 0 0 0 0.1 1 normal


#> output detection

#cauldron detection
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s if block ^ ^-1 ^2 minecraft:cauldron run tag @s add TC_cauldron

#anvil detection
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s if block ^ ^-1 ^2 minecraft:anvil run tag @s add TC_anvil

#anvil specific detection
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_anvil] at @s positioned ^ ^ ^2 if entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:clay_ball",Count:1b}}] run tag @s add TC_nugget
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_anvil] at @s positioned ^ ^ ^2 if entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:brick",Count:1b}}] run tag @s add TC_ingot

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_anvil] at @s positioned ^ ^ ^2 if entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_pickaxe",Count:1b}}] run tag @s add TC_pickaxe
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_anvil] at @s positioned ^ ^ ^2 if entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_sword",Count:1b}}] run tag @s add TC_sword
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_anvil] at @s positioned ^ ^ ^2 if entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_axe",Count:1b}}] run tag @s add TC_axe
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_anvil] at @s positioned ^ ^ ^2 if entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_shovel",Count:1b}}] run tag @s add TC_shovel
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_anvil] at @s positioned ^ ^ ^2 if entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_hoe",Count:1b}}] run tag @s add TC_hoe

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_anvil,tag=!TC_nugget,tag=!TC_ingot,tag=!TC_pickaxe,tag=!TC_sword,tag=!TC_axe,tag=!TC_shovel,tag=!TC_hoe] at @s positioned ^ ^ ^2 if entity @e[type=minecraft:item_frame,distance=..0.2] run tag @s add TC_pressureplate


#> item frame rotation fix

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_north,tag=TC_anvil] at @s positioned ^ ^ ^2 unless entity @e[type=minecraft:item_frame,distance=..0.2,nbt={ItemRotation:0b}] run tag @e[type=minecraft:item_frame,distance=..0.2] add TC_itemframenorth

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_south,tag=TC_anvil] at @s positioned ^ ^ ^2 unless entity @e[type=minecraft:item_frame,distance=..0.2,nbt={ItemRotation:4b}] run tag @e[type=minecraft:item_frame,distance=..0.2] add TC_itemframesouth

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_east,tag=TC_anvil] at @s positioned ^ ^ ^2 unless entity @e[type=minecraft:item_frame,distance=..0.2,nbt={ItemRotation:2b}] run tag @e[type=minecraft:item_frame,distance=..0.2] add TC_itemframeeast

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_west,tag=TC_anvil] at @s positioned ^ ^ ^2 unless entity @e[type=minecraft:item_frame,distance=..0.2,nbt={ItemRotation:6b}] run tag @e[type=minecraft:item_frame,distance=..0.2] add TC_itemframewest

execute as @e[type=minecraft:item_frame,tag=TC_itemframenorth] at @s positioned ^ ^ ^2 run data modify entity @s ItemRotation set value 0
execute as @e[type=minecraft:item_frame,tag=TC_itemframesouth] at @s positioned ^ ^ ^2 run data modify entity @s ItemRotation set value 4
execute as @e[type=minecraft:item_frame,tag=TC_itemframeeast] at @s positioned ^ ^ ^2 run data modify entity @s ItemRotation set value 2
execute as @e[type=minecraft:item_frame,tag=TC_itemframewest] at @s positioned ^ ^ ^2 run data modify entity @s ItemRotation set value 6

execute as @e[tag=TC_itemframenorth] run tag @s remove TC_itemframenorth
execute as @e[tag=TC_itemframesouth] run tag @s remove TC_itemframesouth
execute as @e[tag=TC_itemframeeast] run tag @s remove TC_itemframeeast
execute as @e[tag=TC_itemframewest] run tag @s remove TC_itemframewest


#> pouring detection

#count timer when pouring
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s if block ^ ^ ^2 minecraft:lever[powered=true] run scoreboard players add @s TC_OutputTimer 1

#play lever clang sound t=2
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_OutputTimer=2}] at @s run playsound minecraft:block.anvil.place block @a ^ ^ ^2 1 2 0

#play pouring sound t=2
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_OutputTimer=2}] at @s run playsound minecraft:item.bucket.empty_lava block @a ^ ^ ^2 1 0 0

#play start particle t=2
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_OutputTimer=2}] at @s run particle minecraft:lava ^ ^ ^2 0 0 0 0 5 normal


#> remove storage

function tinkererscraft:packages/remove_storage_when_casting


#> force stop conditions

#stop if null
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputnull,scores={TC_OutputTimer=1..}] at @s run tag @s add TC_stoppour

#stop if empty
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputiron,scores={TC_OutputTimer=1..,TC_lIron=0}] at @s run tag @s add TC_stoppour
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputgold,scores={TC_OutputTimer=1..,TC_lGold=0}] at @s run tag @s add TC_stoppour
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputobsidian,scores={TC_OutputTimer=1..,TC_lObsidian=0}] at @s run tag @s add TC_stoppour
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputirgol,scores={TC_OutputTimer=1..,TC_lIrgol=0}] at @s run tag @s add TC_stoppour
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputobdiam,scores={TC_OutputTimer=1..,TC_lObdiam=0}] at @s run tag @s add TC_stoppour

#stop if empty anvil
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_anvil,tag=!TC_nugget,tag=!TC_ingot,tag=!TC_pickaxe,tag=!TC_sword,tag=!TC_axe,tag=!TC_shovel,tag=!TC_hoe,tag=!TC_pressureplate,scores={TC_OutputTimer=1..}] at @s run tag @s add TC_stoppour

#stop if no anvil or cauldron
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=!TC_cauldron,tag=!TC_anvil,scores={TC_OutputTimer=1..}] at @s run tag @s add TC_stoppour

#stop if cannot cast
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputobsidian,tag=TC_anvil,tag=TC_nugget,scores={TC_OutputTimer=1..}] at @s run tag @s add TC_stoppour
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputobsidian,tag=TC_anvil,tag=TC_ingot,scores={TC_OutputTimer=1..}] at @s run tag @s add TC_stoppour
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputobsidian,tag=TC_anvil,tag=TC_pickaxe,scores={TC_OutputTimer=1..}] at @s run tag @s add TC_stoppour
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputobsidian,tag=TC_anvil,tag=TC_sword,scores={TC_OutputTimer=1..}] at @s run tag @s add TC_stoppour
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputobsidian,tag=TC_anvil,tag=TC_axe,scores={TC_OutputTimer=1..}] at @s run tag @s add TC_stoppour
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputobsidian,tag=TC_anvil,tag=TC_shovel,scores={TC_OutputTimer=1..}] at @s run tag @s add TC_stoppour
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputobsidian,tag=TC_anvil,tag=TC_hoe,scores={TC_OutputTimer=1..}] at @s run tag @s add TC_stoppour
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputobsidian,tag=TC_anvil,tag=TC_pressureplate,scores={TC_OutputTimer=1..}] at @s run tag @s add TC_stoppour

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputirgol,tag=TC_cauldron,scores={TC_OutputTimer=1..}] at @s run tag @s add TC_stoppour
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputirgol,tag=TC_anvil,tag=TC_nugget,scores={TC_OutputTimer=1..}] at @s run tag @s add TC_stoppour
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputirgol,tag=TC_anvil,tag=TC_ingot,scores={TC_OutputTimer=1..}] at @s run tag @s add TC_stoppour
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputirgol,tag=TC_anvil,tag=TC_pressureplate,scores={TC_OutputTimer=1..}] at @s run tag @s add TC_stoppour

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputobdiam,tag=TC_cauldron,scores={TC_OutputTimer=1..}] at @s run tag @s add TC_stoppour
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputobdiam,tag=TC_anvil,tag=TC_nugget,scores={TC_OutputTimer=1..}] at @s run tag @s add TC_stoppour
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputobdiam,tag=TC_anvil,tag=TC_ingot,scores={TC_OutputTimer=1..}] at @s run tag @s add TC_stoppour
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_outputobdiam,tag=TC_anvil,tag=TC_pressureplate,scores={TC_OutputTimer=1..}] at @s run tag @s add TC_stoppour


#> give items

function tinkererscraft:packages/give_cast_item


#> finish casting effects

#play lever clang sound
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_stoppour] at @s run playsound minecraft:block.anvil.place block @a ^ ^ ^2 1 2 0

#reset lever
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_stoppour] at @s if block ^ ^ ^2 minecraft:lever[facing=north,powered=true] run setblock ^ ^ ^2 minecraft:lever[facing=north,powered=false] replace
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_stoppour] at @s if block ^ ^ ^2 minecraft:lever[facing=south,powered=true] run setblock ^ ^ ^2 minecraft:lever[facing=south,powered=false] replace
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_stoppour] at @s if block ^ ^ ^2 minecraft:lever[facing=east,powered=true] run setblock ^ ^ ^2 minecraft:lever[facing=east,powered=false] replace
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_stoppour] at @s if block ^ ^ ^2 minecraft:lever[facing=west,powered=true] run setblock ^ ^ ^2 minecraft:lever[facing=west,powered=false] replace

#reset timer
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_OutputTimer=1..}] at @s if block ^ ^ ^2 minecraft:lever[powered=false] run scoreboard players reset @s TC_OutputTimer

#remove tag
execute as @e[tag=TC_stoppour] run tag @s remove TC_stoppour


#> fire hazard

#fire if jump on pouring metal
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s if block ^ ^ ^2 minecraft:lever[powered=true] positioned ^ ^ ^2 if entity @a[distance=..0.6] run summon minecraft:small_fireball ~ ~3 ~ {Motion:[0.0,-10.0,0.0]}

#remove items if pouring metal
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery] at @s if block ^ ^ ^2 minecraft:lever[powered=true] positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item,distance=..0.5,limit=1,sort=random] Fire set value 1000000

execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_cauldron] at @s if block ^ ^ ^2 minecraft:lever[powered=true] positioned ^ ^-1 ^2 run data modify entity @e[type=minecraft:item,distance=..0.5,limit=1,sort=random] Fire set value 1000000


#> lever particles

#cauldron flow
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_cauldron] at @s if block ^ ^ ^2 minecraft:lever[powered=true] run particle minecraft:falling_lava ^ ^ ^2 0 0 0 0 1 force
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_cauldron] at @s if block ^ ^ ^2 minecraft:lever[powered=true] run particle minecraft:ash ^ ^0.1 ^2 0 0 0 0 1 normal
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_cauldron] at @s if block ^ ^ ^2 minecraft:lever[powered=true] run particle minecraft:smoke ^ ^-0.1 ^2 0 0.2 0 0 1 normal

#anvil flow
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_anvil] at @s if block ^ ^ ^2 minecraft:lever[powered=true] run particle minecraft:falling_lava ^ ^ ^2 0.1 0 0.1 0 1 normal
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_anvil] at @s if block ^ ^ ^2 minecraft:lever[powered=true] run particle minecraft:crimson_spore ^ ^ ^2 0.1 0 0.1 0 1 normal
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,tag=TC_anvil] at @s if block ^ ^ ^2 minecraft:lever[powered=true] run particle minecraft:smoke ^ ^ ^2 0.1 0 0.1 0 1 force


#> just casted item particles

execute as @e[type=minecraft:item,tag=TC_justcasted] at @s run particle minecraft:smoke ~ ~0.25 ~ 0.1 0.1 0.1 0 1 force


#> particle effects for flaming items

execute as @e[nbt={SelectedItem:{tag:{TC_Flaming:1b}}}] at @s run tag @s add TC_holdFlaming
execute as @e[nbt={Item:{tag:{TC_Flaming:1b}}}] at @s run tag @s add TC_holdFlaming
execute as @e[tag=TC_holdFlaming] at @s run scoreboard players add @s TC_FlamingTimer 1

execute as @e[tag=TC_holdFlaming,scores={TC_FlamingTimer=35}] at @s run particle minecraft:flame ~1 ~0.3 ~ 0 0 0 0 1 normal
execute as @e[tag=TC_holdFlaming,scores={TC_FlamingTimer=35}] at @s run particle minecraft:flame ~ ~0.3 ~1 0 0 0 0 1 normal
execute as @e[tag=TC_holdFlaming,scores={TC_FlamingTimer=35}] at @s run particle minecraft:flame ~-1 ~0.3 ~ 0 0 0 0 1 normal
execute as @e[tag=TC_holdFlaming,scores={TC_FlamingTimer=35}] at @s run particle minecraft:flame ~ ~0.3 ~-1 0 0 0 0 1 normal

execute as @e[tag=TC_holdFlaming,scores={TC_FlamingTimer=50}] at @s run particle minecraft:flame ~0.7 ~0.3 ~0.7 0 0 0 0 1 normal
execute as @e[tag=TC_holdFlaming,scores={TC_FlamingTimer=50}] at @s run particle minecraft:flame ~-0.7 ~0.3 ~0.7 0 0 0 0 1 normal
execute as @e[tag=TC_holdFlaming,scores={TC_FlamingTimer=50}] at @s run particle minecraft:flame ~0.7 ~0.3 ~-0.7 0 0 0 0 1 normal
execute as @e[tag=TC_holdFlaming,scores={TC_FlamingTimer=50}] at @s run particle minecraft:flame ~-0.7 ~0.3 ~-0.7 0 0 0 0 1 normal

execute as @e[tag=TC_holdFlaming,scores={TC_FlamingTimer=50..}] at @s run scoreboard players reset @s TC_FlamingTimer
execute as @e[tag=!TC_holdFlaming] run scoreboard players reset @s TC_FlamingTimer
execute as @e[tag=TC_holdFlaming] run tag @s remove TC_holdFlaming


#> particle effects for shiny items

execute as @e[nbt={SelectedItem:{tag:{TC_Shiny:1b}}}] at @s run tag @s add TC_holdShiny
execute as @e[tag=TC_holdShiny] at @s run scoreboard players add @s TC_ShinyTimer 1

execute as @e[tag=TC_holdShiny,scores={TC_ShinyTimer=5..}] at @s run particle minecraft:composter ~ ~0.8 ~ 0.25 0.4 0.25 0 1 normal

execute as @e[tag=TC_holdShiny,scores={TC_ShinyTimer=5..}] at @s run scoreboard players reset @s TC_ShinyTimer
execute as @e[tag=!TC_holdShiny] run scoreboard players reset @s TC_ShinyTimer
execute as @e[tag=TC_holdShiny] run tag @s remove TC_holdShiny


#> auto smelt
# Custom enchant for Obdiam tools

# active weapon detection
execute as @e[nbt={SelectedItem:{tag:{TC_Heated:1b}}}] at @s run tag @s add TC_holdHeated
execute as @e[nbt={Item:{tag:{TC_Heated:1b}}}] at @s run tag @s add TC_holdHeated

# tool ability
#start smelting everything in a 5 block radius
execute as @e[tag=TC_holdHeated] at @s as @e[type=minecraft:item,distance=..5] unless entity @s[nbt={Item:{tag:{TC_Heated:1b}}}] run scoreboard players add @s TC_SmeltingTimer 2

#cool down over time
execute as @e[scores={TC_SmeltingTimer=1..}] at @s run scoreboard players remove @s TC_SmeltingTimer 1

#smelting smoke
execute as @e[scores={TC_SmeltingTimer=1..}] at @s run particle minecraft:smoke ~ ~0.3 ~ 0.1 0.1 0.1 0 1 normal

#smelt items
function tinkererscraft:packages/smelt_vanilla_items

#reset timer
execute as @e[scores={TC_SmeltingTimer=100..}] at @s run scoreboard players set @s TC_SmeltingTimer 100

# remove tag
execute as @e[tag=TC_holdHeated] at @s run tag @s remove TC_holdHeated


#> lunge
# Custom enchant for Irgol swords

# active weapon detection
execute as @e[nbt={SelectedItem:{tag:{TC_Lunge:1b}}}] at @s run tag @s add TC_holdLunge
execute as @e[tag=TC_holdLunge] at @s if predicate tinkererscraft:player_checkers/is_sneaking run tag @s add TC_usingLunge

# weapon ability
execute as @e[tag=TC_usingLunge,scores={TC_LungeTimer=5}] at @s run effect give @s minecraft:speed 1 0 true
execute as @e[tag=TC_usingLunge,scores={TC_LungeTimer=5}] at @s run effect give @s minecraft:jump_boost 1 0 true
execute as @e[tag=TC_usingLunge,scores={TC_LungeTimer=5}] at @s run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 0.5 1 0

execute as @e[tag=TC_usingLunge,scores={TC_LungeTimer=20}] at @s run effect give @s minecraft:speed 1 1 true
execute as @e[tag=TC_usingLunge,scores={TC_LungeTimer=20}] at @s run effect give @s minecraft:jump_boost 1 0 true
execute as @e[tag=TC_usingLunge,scores={TC_LungeTimer=20}] at @s run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 0.5 1.2 0

execute as @e[tag=TC_usingLunge,scores={TC_LungeTimer=35..}] at @s run effect give @s minecraft:speed 2 2 true
execute as @e[tag=TC_usingLunge,scores={TC_LungeTimer=35..}] at @s run effect give @s minecraft:jump_boost 1 0 true
execute as @e[tag=TC_usingLunge,scores={TC_LungeTimer=35}] at @s run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 0.5 1.4 0

execute as @e[tag=TC_usingLunge,scores={TC_LungeTimer=36..}] at @s if predicate tinkererscraft:player_checkers/is_sneaking_ run particle minecraft:smoke ~ ~1 ~ 0.2 0.2 0.2 0.1 20 normal

# weapon skill move
execute as @e[tag=TC_usingLunge,scores={TC_LungeTimer=36..40},nbt={OnGround:0b}] at @s if predicate tinkererscraft:player_checkers/is_sneaking_ run tag @s add TC_boostedLunge
execute as @e[tag=TC_boostedLunge] at @s run effect give @s minecraft:speed 5 2 true
execute as @e[tag=TC_boostedLunge] at @s run effect give @s minecraft:jump_boost 2 0 true
execute as @e[tag=TC_boostedLunge] at @s run particle minecraft:explosion ~ ~0.2 ~ 0 0 0 0 1 force
execute as @e[tag=TC_boostedLunge] at @s run playsound entity.generic.explode block @a ~ ~ ~ 0.5 2 0

execute as @e[tag=TC_boostedLunge] at @s run advancement grant @s only tinkererscraft:tinkerers_craft/lunge_skill

execute as @e[tag=TC_boostedLunge] at @s run tag @s remove TC_boostedLunge


# cancel lunge
execute as @e[tag=!TC_holdLunge] run tag @s remove TC_usingLunge
execute as @e[tag=TC_usingLunge] if predicate tinkererscraft:player_checkers/is_sneaking_ run tag @s remove TC_usingLunge

# reset lunge
execute as @e[tag=!TC_usingLunge] run scoreboard players reset @s TC_LungeTimer

# remove tag
execute as @e[tag=TC_holdLunge] at @s run tag @s remove TC_holdLunge


#> Riptide
# Custom enchant for obdiam swords

# active weapon detection
execute as @e[nbt={SelectedItem:{tag:{TC_Riptide:1b}}}] at @s run tag @s add TC_holdRiptide

# hurt detector
execute as @e[type=!minecraft:player,type=!minecraft:armor_stand,type=!minecraft:wither,type=!minecraft:ender_dragon,type=!minecraft:elder_guardian,type=!minecraft:evoker,type=!minecraft:enderman,type=!minecraft:shulker,type=!minecraft:giant,tag=!TC_hurt,nbt={HurtTime:10s}] at @s run tag @s add TC_hurt

#> randomizer
scoreboard players add @e[tag=TC_hurt] TC_rand_20 1
scoreboard players set @e[tag=TC_hurt,scores={TC_rand_20=20..}] TC_rand_20 1

# weapon ability
execute as @e[tag=TC_holdRiptide] at @s run tag @e[tag=TC_hurt,scores={TC_rand_20=4},distance=..4] add TC_rip

execute as @e[tag=TC_rip] at @s run scoreboard players add @s TC_RiptideTimer 1

execute as @e[tag=TC_rip,scores={TC_RiptideTimer=1}] at @s run effect give @s minecraft:levitation 2 3 true

execute as @e[tag=TC_rip,scores={TC_RiptideTimer=10}] at @s run playsound minecraft:entity.player.attack.sweep block @a ~ ~ ~ 0.7 1.6 0
execute as @e[tag=TC_rip,scores={TC_RiptideTimer=15}] at @s run playsound minecraft:entity.player.attack.sweep block @a ~ ~ ~ 0.7 1.6 0
execute as @e[tag=TC_rip,scores={TC_RiptideTimer=20}] at @s run playsound minecraft:entity.player.attack.sweep block @a ~ ~ ~ 0.7 1.6 0
execute as @e[tag=TC_rip,scores={TC_RiptideTimer=25}] at @s run playsound minecraft:entity.player.attack.sweep block @a ~ ~ ~ 0.7 1.6 0
execute as @e[tag=TC_rip,scores={TC_RiptideTimer=35}] at @s run playsound minecraft:entity.player.attack.sweep block @a ~ ~ ~ 0.7 1.6 0

execute as @e[tag=TC_rip] at @s run particle minecraft:crit ~ ~0.5 ~ 0.5 0.4 0.5 0.1 2 force

execute as @e[tag=TC_rip,scores={TC_RiptideTimer=35..}] at @s run particle minecraft:explosion ~ ~ ~ 0 0 0 0 1 force
execute as @e[tag=TC_rip,scores={TC_RiptideTimer=35..}] at @s run playsound minecraft:entity.generic.explode block @a ~ ~ ~ 1 2 0

function tinkererscraft:packages/loot_doubler

execute as @e[tag=TC_rip,scores={TC_RiptideTimer=35..}] at @s run kill @s


# remove tag
execute as @e[tag=TC_hurt] at @s run tag @s remove TC_hurt
execute as @e[tag=TC_holdRiptide] at @s run tag @s remove TC_holdRiptide


#> guidebook visual guide

#active detection
execute as @e[nbt={SelectedItem:{tag:{TC_GuideBook:1b}}}] at @s if predicate tinkererscraft:player_checkers/is_sneaking run tag @s add TC_activateGuideBook

#player orientation detection
execute as @e[tag=TC_activateGuideBook,y_rotation=135..225] run tag @s add TC_facingNorth
execute as @e[tag=TC_activateGuideBook,y_rotation=225..315] run tag @s add TC_facingEast
execute as @e[tag=TC_activateGuideBook,y_rotation=315..45] run tag @s add TC_facingSouth
execute as @e[tag=TC_activateGuideBook,y_rotation=45..135] run tag @s add TC_facingWest

#place guide
function tinkererscraft:packages/guide_book/north_smeltery
function tinkererscraft:packages/guide_book/east_smeltery
function tinkererscraft:packages/guide_book/south_smeltery
function tinkererscraft:packages/guide_book/west_smeltery

# remove tag
execute as @e[tag=TC_activateGuideBook] at @s run tag @s remove TC_activateGuideBook
execute as @e[tag=TC_facingNorth] at @s run tag @s remove TC_facingNorth
execute as @e[tag=TC_facingEast] at @s run tag @s remove TC_facingEast
execute as @e[tag=TC_facingSouth] at @s run tag @s remove TC_facingSouth
execute as @e[tag=TC_facingWest] at @s run tag @s remove TC_facingWest


#> remove grinded tools

execute as @a run clear @s minecraft:golden_pickaxe{TC_Casted:1b,RepairCost:0}
execute as @a run clear @s minecraft:golden_sword{TC_Casted:1b,RepairCost:0}
execute as @a run clear @s minecraft:golden_axe{TC_Casted:1b,RepairCost:0}
execute as @a run clear @s minecraft:golden_shovel{TC_Casted:1b,RepairCost:0}
execute as @a run clear @s minecraft:golden_hoe{TC_Casted:1b,RepairCost:0}

execute as @a run clear @s minecraft:netherite_pickaxe{TC_Casted:1b,RepairCost:0}
execute as @a run clear @s minecraft:netherite_sword{TC_Casted:1b,RepairCost:0}
execute as @a run clear @s minecraft:netherite_axe{TC_Casted:1b,RepairCost:0}
execute as @a run clear @s minecraft:netherite_shovel{TC_Casted:1b,RepairCost:0}
execute as @a run clear @s minecraft:netherite_hoe{TC_Casted:1b,RepairCost:0}


#> clear memory

execute as @e[tag=TC_cauldron] run tag @s remove TC_cauldron
execute as @e[tag=TC_anvil] run tag @s remove TC_anvil
execute as @e[tag=TC_ingot] run tag @s remove TC_ingot
execute as @e[tag=TC_nugget] run tag @s remove TC_nugget
execute as @e[tag=TC_pickaxe] run tag @s remove TC_pickaxe
execute as @e[tag=TC_sword] run tag @s remove TC_sword
execute as @e[tag=TC_axe] run tag @s remove TC_axe
execute as @e[tag=TC_shovel] run tag @s remove TC_shovel
execute as @e[tag=TC_hoe] run tag @s remove TC_hoe
execute as @e[tag=TC_pressureplate] run tag @s remove TC_pressureplate
