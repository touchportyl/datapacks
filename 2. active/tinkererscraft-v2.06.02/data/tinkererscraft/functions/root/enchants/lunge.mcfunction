# code for the lunge enchant


# tag
execute as @e[nbt={SelectedItem:{tag:{TC_Lunge:1b}}}] at @s run tag @s add TC_holdLunge
execute as @e[tag=TC_holdLunge] at @s if predicate tinkererscraft:player/is_sneaking run tag @s add TC_usingLunge

#> controller
execute as @e[tag=TC_usingLunge] run function tinkererscraft:root/enchants/lunge/controller

# catch
execute as @e[tag=!TC_holdLunge] run tag @s remove TC_usingLunge
execute as @e[tag=TC_usingLunge] if predicate tinkererscraft:player/is_sneaking_ run tag @s remove TC_usingLunge
execute as @e[tag=TC_usingLunge,nbt={OnGround:0b}] run tag @s remove TC_usingLunge

# reset lunge
execute as @e[tag=!TC_usingLunge] run scoreboard players reset @s TC_LungeTimer

#todo:gc
execute as @e[tag=TC_holdLunge] at @s run tag @s remove TC_holdLunge