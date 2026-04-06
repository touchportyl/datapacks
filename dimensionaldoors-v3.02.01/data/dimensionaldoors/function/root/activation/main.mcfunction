# grant advancement
advancement grant @a[tag=DD_enter] only dimensionaldoors:adventure/dimensional_doors

# warp particle
function dimensionaldoors:effects/warppoint

# tag close
execute as @e[tag=DD_enter] at @s run tag @e[tag=DD_portal,distance=..2,sort=nearest,limit=1] add DD_close


# warp direction detection
# determine if player is going from entrance to exit or vice versa
execute as @e[tag=DD_portal,tag=DD_entrance] at @s run tag @e[tag=DD_enter,distance=..2,sort=nearest] add DD_enter+
execute as @e[tag=DD_portal,tag=DD_exit] at @s run tag @e[tag=DD_enter,distance=..2,sort=nearest] add DD_enter-



# teleporting handler (extracted for clarity)
execute if entity @e[tag=DD_enter+] run function dimensionaldoors:root/activation/entrance_to_exit
execute if entity @e[tag=DD_enter-] run function dimensionaldoors:root/activation/exit_to_entrance


# displace the player
# has the unintended side effect of displacing the player if the doors are too close
# this makes it more "realistic" as opening two connected wormholes next to each other would be unstable
execute as @e[tag=DD_door404] at @s run function dimensionaldoors:effects/portaldisplacement

# move to correct location
# player should be in front of the closed door
execute as @e[tag=DD_enter,tag=!DD_door404] at @s run tp @s ^ ^ ^1

# play teleport and closing door sound
execute as @e[tag=DD_enter,tag=!DD_door404] at @e[tag=DD_portal,distance=..2,sort=nearest,limit=1] run function dimensionaldoors:effects/teleporteffects

# set warp cooldown (in seconds)
scoreboard players add @e[tag=DD_enter] DD_warpcooldown 1


# clear cache
execute as @e[tag=DD_enter] run tag @s remove DD_enter
execute as @e[tag=DD_enter+] run tag @s remove DD_enter+
execute as @e[tag=DD_enter-] run tag @s remove DD_enter-
execute as @e[tag=DD_door404] run tag @s remove DD_door404