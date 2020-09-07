#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> item detection > storage fill
execute as @e[type=minecraft:item] at @s if block ~ ~-1 ~ minecraft:gilded_blackstone run function tinkererscraft:modules/smelting/item_detection

#> build > initialize
execute as @e[tag=TC_buildsmeltery] at @s align xyz unless entity @e[tag=TC_smeltery,distance=..15] run function tinkererscraft:modules/smeltery/build

#> smelt
execute as @e[tag=TC_smelting] at @s as @e[tag=TC_smeltery,distance=..2] at @s align xyz run function tinkererscraft:modules/smelting/smelt

#sfx:slag
execute as @e[tag=TC_slag] at @s run function tinkererscraft:modules/smelting/slag

#> irgol
execute as @e[tag=TC_irgolreaction] at @s run function tinkererscraft:modules/smelting/reacting/irgol

#> odbiam
execute as @e[tag=TC_obdiamreaction] at @s run function tinkererscraft:modules/smelting/reacting/odbiam

#> limit > todo
execute as @e[tag=TC_smeltery] at @s run function tinkererscraft:modules/smeltery/capacity/limit

#todo:gc
execute as @e[tag=TC_smelting] at @s run kill @s

#> check > remove
execute as @e[tag=TC_smeltery] at @s run function tinkererscraft:modules/smeltery/check

#> ambient
execute as @e[tag=TC_smeltery] at @s run function tinkererscraft:modules/effects/smeltery/ambient

#> controller
execute as @e[tag=TC_smeltery] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run function tinkererscraft:modules/smeltery/ui/controller

#> check > check_anvil
execute as @e[tag=TC_smeltery] at @s run function tinkererscraft:modules/casting/output/check

#> item_frame_alignment
execute as @e[tag=TC_smeltery,tag=TC_anvil] at @s run function tinkererscraft:modules/smeltery/item_frame_alignment

#> controller > fx & drain > (item to drain) > casting_item
execute as @e[tag=TC_smeltery] at @s if block ^ ^ ^2 minecraft:lever[powered=true] run function tinkererscraft:modules/casting/pouring/controller

#> casting_hazard
execute as @e[tag=TC_smeltery] at @s if block ^ ^ ^2 minecraft:lever[powered=true] positioned ^ ^ ^2 run function tinkererscraft:modules/casting/hazard

#> casting_recent
execute as @e[tag=TC_justcasted] run function tinkererscraft:modules/casting/recent

#> flaming > controller
function tinkererscraft:modules/enchants/flaming

#> shiny > controller
function tinkererscraft:modules/enchants/shiny

#> heated > controller
function tinkererscraft:modules/enchants/heated

#> lunge > controller
function tinkererscraft:modules/enchants/lunge

#> riptide > controller
function tinkererscraft:modules/enchants/riptide







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
