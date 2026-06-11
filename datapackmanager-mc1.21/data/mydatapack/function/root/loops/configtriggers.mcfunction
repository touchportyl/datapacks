# check for config changes
execute as @a if score @s z_md_001_t matches 1.. run scoreboard players operation CONFIG$confignameone MyDatapack = BOOL$true DatapackManager
execute as @a if score @s z_md_001_f matches 1.. run scoreboard players operation CONFIG$confignameone MyDatapack = BOOL$false DatapackManager
execute as @a if score @s z_md_002_t matches 1.. run scoreboard players operation CONFIG$confignametwo MyDatapack = BOOL$true DatapackManager
execute as @a if score @s z_md_002_f matches 1.. run scoreboard players operation CONFIG$confignametwo MyDatapack = BOOL$false DatapackManager

execute as @a if score @s z_md_001_t matches 1.. run function mydatapack:packages/configtriggers/reset
execute as @a if score @s z_md_001_f matches 1.. run function mydatapack:packages/configtriggers/reset
execute as @a if score @s z_md_002_t matches 1.. run function mydatapack:packages/configtriggers/reset
execute as @a if score @s z_md_002_f matches 1.. run function mydatapack:packages/configtriggers/reset

# loop
execute if score LOOP$configtriggers.isActive MyDatapack = BOOL$true DatapackManager run schedule function mydatapack:root/loops/configtriggers 4t