# clears up the smeltery components


#fx:destroy
function tinkererscraft:effects/smeltery/destroy

# remove AECs
execute as @s at @s positioned ^ ^1 ^1 run kill @e[type=minecraft:area_effect_cloud,tag=TC_display,distance=..1]
kill @s