#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> main
# this is the main controller that runs the entirety of tinkerers craft


#> detection > storage fill
execute as @e[type=minecraft:item] at @s if block ~ ~-1 ~ minecraft:gilded_blackstone run function tinkererscraft:modules/smelting/detection

#> build > initialize
execute as @e[tag=TC_buildsmeltery] at @s align xyz unless entity @e[tag=TC_smeltery,distance=..15] run function tinkererscraft:modules/smeltery/build

#> smelt
execute as @e[tag=TC_smelting] at @s as @e[tag=TC_smeltery,distance=..2] at @s align xyz run function tinkererscraft:modules/smelting/smelt

#> slag
execute as @e[tag=TC_slag] at @s run function tinkererscraft:modules/smelting/slag
execute as @e[tag=TC_irgolreaction] if score @s TC_lIrgol < @s TC_lCapacity as @e[tag=TC_slag] at @s run function tinkererscraft:modules/smelting/slag
execute as @e[tag=TC_obdiamreaction] if score @s TC_lObdiam < @s TC_lCapacity as @e[tag=TC_slag] at @s run function tinkererscraft:modules/smelting/slag

#> irgol
execute as @e[tag=TC_irgolreaction] at @s unless score @s TC_lIrgol >= @s TC_lCapacity run function tinkererscraft:modules/smelting/reacting/irgol

#> odbiam
execute as @e[tag=TC_obdiamreaction] at @s unless score @s TC_lObdiam >= @s TC_lCapacity run function tinkererscraft:modules/smelting/reacting/odbiam

#> limiter
execute as @e[tag=TC_smeltery] at @s run function tinkererscraft:modules/smeltery/capacity/limiter

#todo:gc
execute as @e[tag=TC_smelting] at @s run kill @s

#> check > remove
execute as @e[tag=TC_smeltery] at @s run function tinkererscraft:modules/smeltery/check

#> ambient
execute as @e[tag=TC_smeltery,tag=!TC_noeffects] at @s run function tinkererscraft:modules/effects/smeltery/ambient

#> controller
execute as @e[tag=TC_smeltery] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run function tinkererscraft:modules/smeltery/ui/controller

#> check > check_anvil
execute as @e[tag=TC_smeltery] at @s run function tinkererscraft:modules/casting/output/check

#> item_frame_alignment
execute as @e[tag=TC_smeltery,tag=TC_anvil] at @s run function tinkererscraft:modules/smeltery/item_frame_alignment

#> controller > fx & drain > (item to drain) > casting_item
execute as @e[tag=TC_smeltery] at @s if block ^ ^ ^2 minecraft:lever[powered=true] run function tinkererscraft:modules/casting/pouring/controller

#> casting recent
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

#> help
function tinkererscraft:modules/smeltery/ui/help/display

#> guidebook
execute as @e[nbt={Item:{tag:{TC_GuideBook:1b}},OnGround:1b}] at @s run function tinkererscraft:modules/effects/guidebook

#> guide
execute as @e[nbt={SelectedItem:{tag:{TC_GuideBook:1b}}}] at @s unless entity @e[tag=TC_smeltery,distance=..15] if predicate tinkererscraft:player_checkers/is_sneaking run function tinkererscraft:modules/smeltery/guide

#> garbage_collection
function tinkererscraft:modules/garbage_collection/controller


#> End of file
#> -----------
