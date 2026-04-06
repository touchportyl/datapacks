# check for config changes
execute as @a if score @s z_pt_001_t matches 1.. run scoreboard players operation CONFIG$confignameone PortylTrident = BOOL$true DatapackManager
execute as @a if score @s z_pt_001_f matches 1.. run scoreboard players operation CONFIG$confignameone PortylTrident = BOOL$false DatapackManager
execute as @a if score @s z_pt_002_t matches 1.. run scoreboard players operation CONFIG$confignametwo PortylTrident = BOOL$true DatapackManager
execute as @a if score @s z_pt_002_f matches 1.. run scoreboard players operation CONFIG$confignametwo PortylTrident = BOOL$false DatapackManager

execute as @a if score @s z_pt_001_t matches 1.. run function portyltrident:packages/configtriggers/reset
execute as @a if score @s z_pt_001_f matches 1.. run function portyltrident:packages/configtriggers/reset
execute as @a if score @s z_pt_002_t matches 1.. run function portyltrident:packages/configtriggers/reset
execute as @a if score @s z_pt_002_f matches 1.. run function portyltrident:packages/configtriggers/reset

# loop
execute if score LOOP$configtriggers.isActive PortylTrident = BOOL$true DatapackManager run schedule function portyltrident:root/loops/configtriggers 4t