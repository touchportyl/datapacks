# marks entities for death by riptide

#> mob list
# https://minecraft.fandom.com/wiki/Mob#List_of_mobs

# tags
# - TC_riptide_vulnerable
# - TC_markedfordeath
# - TC_markedfordeath_


#> tag entities

# passive mobs

# neutral mobs
tag @e[type=minecraft:cave_spider,tag=!TC_riptide_vulnerable,distance=..15] add TC_riptide_vulnerable
tag @e[type=minecraft:piglin,tag=!TC_riptide_vulnerable,distance=..15] add TC_riptide_vulnerable
tag @e[type=minecraft:spider,tag=!TC_riptide_vulnerable,distance=..15] add TC_riptide_vulnerable
tag @e[type=minecraft:zombified_piglin,tag=!TC_riptide_vulnerable,distance=..15] add TC_riptide_vulnerable

# hostile mobs
tag @e[type=minecraft:blaze,tag=!TC_riptide_vulnerable,distance=..15] add TC_riptide_vulnerable
tag @e[type=minecraft:creeper,tag=!TC_riptide_vulnerable,distance=..15] add TC_riptide_vulnerable
tag @e[type=minecraft:drowned,tag=!TC_riptide_vulnerable,distance=..15] add TC_riptide_vulnerable
tag @e[type=minecraft:evoker,tag=!TC_riptide_vulnerable,distance=..15] add TC_riptide_vulnerable
tag @e[type=minecraft:husk,tag=!TC_riptide_vulnerable,distance=..15] add TC_riptide_vulnerable
tag @e[type=minecraft:piglin_brute,tag=!TC_riptide_vulnerable,distance=..15] add TC_riptide_vulnerable
tag @e[type=minecraft:pillager,tag=!TC_riptide_vulnerable,distance=..15] add TC_riptide_vulnerable
tag @e[type=minecraft:skeleton,tag=!TC_riptide_vulnerable,distance=..15] add TC_riptide_vulnerable
tag @e[type=minecraft:stray,tag=!TC_riptide_vulnerable,distance=..15] add TC_riptide_vulnerable
tag @e[type=minecraft:vindicator,tag=!TC_riptide_vulnerable,distance=..15] add TC_riptide_vulnerable
tag @e[type=minecraft:witch,tag=!TC_riptide_vulnerable,distance=..15] add TC_riptide_vulnerable
tag @e[type=minecraft:wither_skeleton,tag=!TC_riptide_vulnerable,distance=..15] add TC_riptide_vulnerable
tag @e[type=minecraft:zombie,tag=!TC_riptide_vulnerable,distance=..15] add TC_riptide_vulnerable
tag @e[type=minecraft:zombie_villager,tag=!TC_riptide_vulnerable,distance=..15] add TC_riptide_vulnerable


# updates
#execute as @s at @s if score VERSION$minecraft.current DatapackManager matches 21.. run function tinkererscraft:compatibility/enchants/riptide/mark_for_death-1.21


# mark for death
execute if score RAND$6 TinkerersCraft matches 1 as @s at @s run tag @e[tag=TC_riptide_vulnerable,tag=!TC_markedfordeath,tag=!TC_markedfordeath_,sort=random,limit=1] add TC_markedfordeath

execute if score RAND$6 TinkerersCraft matches 2.. as @s at @s run tag @e[tag=TC_riptide_vulnerable,tag=!TC_markedfordeath,tag=!TC_markedfordeath_,sort=random,limit=1] add TC_markedfordeath_