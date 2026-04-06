# check for config changes
execute as @a if score @s z_ss_001_t matches 1.. run scoreboard players operation CONFIG$confignameone Seaskipper = BOOL$true DatapackManager
execute as @a if score @s z_ss_001_f matches 1.. run scoreboard players operation CONFIG$confignameone Seaskipper = BOOL$false DatapackManager
execute as @a if score @s z_ss_002_t matches 1.. run scoreboard players operation CONFIG$confignametwo Seaskipper = BOOL$true DatapackManager
execute as @a if score @s z_ss_002_f matches 1.. run scoreboard players operation CONFIG$confignametwo Seaskipper = BOOL$false DatapackManager

execute as @a if score @s z_ss_001_t matches 1.. run function seaskipper:packages/configtriggers/reset
execute as @a if score @s z_ss_001_f matches 1.. run function seaskipper:packages/configtriggers/reset
execute as @a if score @s z_ss_002_t matches 1.. run function seaskipper:packages/configtriggers/reset
execute as @a if score @s z_ss_002_f matches 1.. run function seaskipper:packages/configtriggers/reset

# loop
execute if score LOOP$configtriggers.isActive Seaskipper = BOOL$true DatapackManager run schedule function seaskipper:root/loops/configtriggers 4t