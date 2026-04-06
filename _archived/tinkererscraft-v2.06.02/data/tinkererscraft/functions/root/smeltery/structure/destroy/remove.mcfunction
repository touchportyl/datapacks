# clears up the smeltery components


# remove lava
setblock ^ ^ ^ minecraft:air replace

# remove display AECs
execute as @s at @s positioned ^ ^1 ^1 run kill @e[type=minecraft:area_effect_cloud,tag=TC_display,distance=..1]

# remove smeltery
kill @s


#fx:destroy
function tinkererscraft:effects/smeltery/destroy