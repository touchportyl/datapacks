# check for config changes
execute as @a if score @s z_aw_001_t matches 1.. run scoreboard players operation CONFIG$confignameone AroundTheWorld = BOOL$true DatapackManager
execute as @a if score @s z_aw_001_f matches 1.. run scoreboard players operation CONFIG$confignameone AroundTheWorld = BOOL$false DatapackManager
execute as @a if score @s z_aw_002_t matches 1.. run scoreboard players operation CONFIG$confignametwo AroundTheWorld = BOOL$true DatapackManager
execute as @a if score @s z_aw_002_f matches 1.. run scoreboard players operation CONFIG$confignametwo AroundTheWorld = BOOL$false DatapackManager

execute as @a if score @s z_aw_001_t matches 1.. run function aroundtheworld:packages/configtriggers/reset
execute as @a if score @s z_aw_001_f matches 1.. run function aroundtheworld:packages/configtriggers/reset
execute as @a if score @s z_aw_002_t matches 1.. run function aroundtheworld:packages/configtriggers/reset
execute as @a if score @s z_aw_002_f matches 1.. run function aroundtheworld:packages/configtriggers/reset

# loop
execute if score LOOP$configtriggers.isActive AroundTheWorld = BOOL$true DatapackManager run schedule function aroundtheworld:root/loops/configtriggers 4t