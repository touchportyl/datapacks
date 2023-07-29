# contains a list of all the loot tables for marked entities

# reference from mark_for_death.mcfunction

execute as @s[type=minecraft:cave_spider] at @s run loot spawn ~ ~ ~ loot minecraft:entities/cave_spider
execute as @s[type=minecraft:piglin] at @s run loot spawn ~ ~ ~ loot minecraft:entities/piglin
execute as @s[type=minecraft:spider] at @s run loot spawn ~ ~ ~ loot minecraft:entities/spider
execute as @s[type=minecraft:zombified_piglin] at @s run loot spawn ~ ~ ~ loot minecraft:entities/zombified_piglin
execute as @s[type=minecraft:blaze] at @s run loot spawn ~ ~ ~ loot minecraft:entities/blaze
execute as @s[type=minecraft:creeper] at @s run loot spawn ~ ~ ~ loot minecraft:entities/creeper
execute as @s[type=minecraft:drowned] at @s run loot spawn ~ ~ ~ loot minecraft:entities/drowned
execute as @s[type=minecraft:evoker] at @s run loot spawn ~ ~ ~ loot minecraft:entities/evoker
execute as @s[type=minecraft:husk] at @s run loot spawn ~ ~ ~ loot minecraft:entities/husk
execute as @s[type=minecraft:piglin_brute] at @s run loot spawn ~ ~ ~ loot minecraft:entities/piglin_brute
execute as @s[type=minecraft:pillager] at @s run loot spawn ~ ~ ~ loot minecraft:entities/pillager
execute as @s[type=minecraft:skeleton] at @s run loot spawn ~ ~ ~ loot minecraft:entities/skeleton
execute as @s[type=minecraft:stray] at @s run loot spawn ~ ~ ~ loot minecraft:entities/stray
execute as @s[type=minecraft:vindicator] at @s run loot spawn ~ ~ ~ loot minecraft:entities/vindicator
execute as @s[type=minecraft:witch] at @s run loot spawn ~ ~ ~ loot minecraft:entities/witch
execute as @s[type=minecraft:wither_skeleton] at @s run loot spawn ~ ~ ~ loot minecraft:entities/wither_skeleton
execute as @s[type=minecraft:zombie] at @s run loot spawn ~ ~ ~ loot minecraft:entities/zombie
execute as @s[type=minecraft:zombie_villager] at @s run loot spawn ~ ~ ~ loot minecraft:entities/zombie_villager

# updates
#execute as @s at @s if score VERSION$minecraft.current DatapackManager matches 21.. run function tinkererscraft:compatibility/enchants/riptide/loot_doubler-1.21