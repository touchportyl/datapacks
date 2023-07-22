# the main controller that runs the entirety of tinkerers craft
# runs on 2t intervals


#> controller > fx & drain > (item to drain) > casting_item
# handles pouring metals when the lever is pulled
execute as @e[tag=TC_smeltery] at @s if block ^ ^ ^2 minecraft:lever[powered=true] run function tinkererscraft:root/casting/pouring/controller


# reset timer if lever is unpowered
execute as @e[type=minecraft:area_effect_cloud,tag=TC_smeltery,scores={TC_OutputTimer=1..}] at @s if block ^ ^ ^2 minecraft:lever[powered=false] run function tinkererscraft:root/casting/stop


#> quirk/enchant detection and execution
function tinkererscraft:root/enchants/controller


#> UI controller
# changes the UI display if the black stained glass is broken
# replaces the glass and removes any glass item if broken with silk touch
execute as @e[tag=TC_smeltery] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run function tinkererscraft:root/smeltery/ui/controller


#> particle effects
# ambient
execute as @e[tag=TC_smeltery] at @s run function tinkererscraft:effects/smeltery/moltenmetal