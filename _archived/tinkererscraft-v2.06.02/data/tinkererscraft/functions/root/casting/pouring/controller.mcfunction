# handles the smeltery's pouring mechanics
# this runs every 2t (10 ticks per second)


# check
function tinkererscraft:root/casting/output/check


# run a timer when pouring
scoreboard players add @s TC_OutputTimer 1


#> timeline

#fx:start pouring
execute as @s[scores={TC_OutputTimer=2}] at @s run function tinkererscraft:effects/casting/start

#fx:cauldron
execute as @s[tag=TC_cauldron] at @s run function tinkererscraft:effects/casting/cauldron

#fx:anvil
execute as @s[tag=TC_anvil] at @s run function tinkererscraft:effects/casting/anvil


# drain the tank every tick
# mechanics are all handled in the function
function tinkererscraft:root/casting/drain


#> conditions
execute as @s[scores={TC_OutputTimer=1..}] run function tinkererscraft:root/casting/pouring/conditions


# update ui
function tinkererscraft:root/smeltery/ui/update