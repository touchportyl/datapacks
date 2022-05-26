# play teleport and closing door sound
execute as @e[tag=DD_portal,tag=DD_close] at @s run function dimensionaldoors:modules/teleporteffects-3.00.00

# door closing mechanism
execute as @e[tag=DD_portal,tag=DD_close] at @s run function dimensionaldoors:modules/door/closermechanism-3.00.00

# cleanup
tag @e[tag=DD_close] remove DD_close
