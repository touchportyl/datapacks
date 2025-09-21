# background game loop


# only run if someone on the server has the conduit advancement
# this is to prevent the function from running when no one has the advancement
execute if entity @a[advancements={dimensionaldoors:adventure/find_conduit=true}] run function dimensionaldoors:root/create/conduitdetection

# check for open doors and close them
execute as @e[tag=DD_portal] at @s run function dimensionaldoors:root/closermechanism/autoclose

# tick down warp cooldown
execute as @e if score @s DD_warpcooldown matches 1.. run scoreboard players remove @e DD_warpcooldown 1
execute as @e if score @s DD_warpcooldown matches ..0 run scoreboard players reset @e DD_warpcooldown


# loop
execute if score LOOP$background.isActive DimensionalDoors = BOOL$true DatapackManager run schedule function dimensionaldoors:root/loops/background 1s