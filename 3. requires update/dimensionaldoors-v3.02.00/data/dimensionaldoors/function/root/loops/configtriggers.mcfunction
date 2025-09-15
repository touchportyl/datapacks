# check for config changes
execute as @a if score @s z_dd_001_t matches 1.. run scoreboard players operation CONFIG$confignameone DimensionalDoors = BOOL$true DatapackManager
execute as @a if score @s z_dd_001_f matches 1.. run scoreboard players operation CONFIG$confignameone DimensionalDoors = BOOL$false DatapackManager
execute as @a if score @s z_dd_002_t matches 1.. run scoreboard players operation CONFIG$confignametwo DimensionalDoors = BOOL$true DatapackManager
execute as @a if score @s z_dd_002_f matches 1.. run scoreboard players operation CONFIG$confignametwo DimensionalDoors = BOOL$false DatapackManager

execute as @a if score @s z_dd_001_t matches 1.. run function dimensionaldoors:packages/configtriggers/reset
execute as @a if score @s z_dd_001_f matches 1.. run function dimensionaldoors:packages/configtriggers/reset
execute as @a if score @s z_dd_002_t matches 1.. run function dimensionaldoors:packages/configtriggers/reset
execute as @a if score @s z_dd_002_f matches 1.. run function dimensionaldoors:packages/configtriggers/reset

# loop
execute if score LOOP$configtriggers.isActive DimensionalDoors = BOOL$true DatapackManager run schedule function dimensionaldoors:root/loops/configtriggers 4t