#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> test


# config bypass: casting iron tools
execute if score $tc.casting.iron TP_config matches 0 run tellraw @a [{"text":"","color":"gray"},{"text":"\n> Casting iron tools is disabled in the config file. Skipping test..."}]

execute if score $tc.casting.iron TP_config matches 0 run scoreboard players add $tc.iron.skipped TC_temp_tests 1
execute if score $tc.casting.iron TP_config matches 0 run scoreboard players add $tc.iron.success TC_temp_tests 1


# check if item is correct
execute at @e[tag=TC_temp_tests_item_frame,sort=nearest,limit=1] as @e[type=item,distance=..2,sort=nearest,limit=1] if data entity @s Item{id:"minecraft:iron_pickaxe",Count:1b}.tag{RepairCost:"2147483648",HideFlags:1,TC_Casted:1b,Damage:0} if entity @s[nbt={Item:{tag:{Enchantments:[{lvl:1s,id:"minecraft:unbreaking"},{lvl:2s,id:"minecraft:efficiency"}]}}}] run scoreboard players add $tc.check.item TC_temp_tests 1

# check if molten metal is used up
execute if score @e[tag=TC_temp_tests_smelting,sort=nearest,limit=1] TC_lIron matches 0 run scoreboard players add $tc.check.smeltery TC_temp_tests 1

# check if lever stopped pouring
execute at @e[tag=TC_temp_tests_smelting,sort=nearest,limit=1] align xyz if block ~0.5 ~ ~2.5 lever[facing=south,powered=false] run scoreboard players add $tc.check.pour TC_temp_tests 1


# calculate difference
scoreboard players operation $tc.check.smeltery.amount TC_temp_tests -= @e[tag=TC_temp_tests_smelting,sort=nearest,limit=1] TC_lIron


execute unless score $tc.iron.skipped TC_temp_tests matches 1.. if score $tc.check.item TC_temp_tests matches 0 run tellraw @a [{"text":""},{"text":"\n> Bug detected! ","color":"red"},{"text":"Casting an iron pickaxe did not produce the correct item"}]

execute unless score $tc.iron.skipped TC_temp_tests matches 1.. if score $tc.check.smeltery TC_temp_tests matches 0 run tellraw @a [{"text":""},{"text":"\n> Bug detected! ","color":"red"},{"text":"Casting an iron pickaxe left "},{"score":{"name":"$tc.check.smeltery.amount","objective":"TC_temp_tests"}},{"text":" liquid metal in the smeltery"}]

execute unless score $tc.iron.skipped TC_temp_tests matches 1.. if score $tc.check.pour TC_temp_tests matches 0 run tellraw @a [{"text":""},{"text":"\n> Bug detected! ","color":"red"},{"text":"The smeltery did not stop pouring after casting"}]

execute unless score $tc.iron.skipped TC_temp_tests matches 1.. if score $tc.check.item TC_temp_tests matches 1 if score $tc.check.smeltery TC_temp_tests matches 1 if score $tc.check.pour TC_temp_tests matches 1 run scoreboard players add $tc.iron.success TC_temp_tests 1


scoreboard players set $tc.check.item TC_temp_tests 0
scoreboard players set $tc.check.smeltery TC_temp_tests 0
scoreboard players set $tc.check.pour TC_temp_tests 0
scoreboard players set @e[tag=TC_temp_tests_smelting] TC_lIron 0

# schedule next
schedule function tinkererscraft:packages/tests/casting/iron/_finish 2t


#> End of file
#> -----------
