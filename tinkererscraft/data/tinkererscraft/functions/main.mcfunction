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

#> smeltery_ambient
execute as @e[tag=TC_smeltery] at @s run function tinkererscraft:modules/effects/smeltery_ambient

#> controller
execute as @e[tag=TC_smeltery] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run function tinkererscraft:modules/smeltery/ui/controller

#> check > check_anvil
execute as @e[tag=TC_smeltery] at @s run function tinkererscraft:modules/smeltery/output/check

#> item_frame_alignment
execute as @e[tag=TC_smeltery,tag=TC_anvil] at @s run function tinkererscraft:modules/smeltery/item_frame_alignment

#> controller > fx & drain > (item to drain) > casting_item
execute as @e[tag=TC_smeltery] at @s if block ^ ^ ^2 minecraft:lever[powered=true] run function tinkererscraft:modules/casting/pouring/controller

#> conditions
execute as @e[tag=TC_smeltery,scores={TC_OutputTimer=1..}] run function tinkererscraft:modules/casting/pouring/conditions

#> stop
execute as @e[tag=TC_stoppour] at @s if block ^ ^ ^2 minecraft:lever[powered=true] run function tinkererscraft:modules/casting/stop

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
