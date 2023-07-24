# the main controller that runs the entirety of tinkerers craft
# runs on 1s intervals

# enforces the smeltery storage limit
execute as @e[tag=TC_smeltery] at @s run function tinkererscraft:root/smeltery/capacity/limiter

# checks if smeltery structures are tampered with
# removes any broken smelteries
execute as @e[tag=TC_smeltery] at @s run function tinkererscraft:root/smeltery/structure/check

# remove grinded tools
function tinkererscraft:root/others/removegrindedtools


#> particle effects
# as of v2.06.00, it is now an infinite lava source
execute as @e[tag=TC_smeltery] at @s unless block ^ ^ ^ minecraft:lava run function tinkererscraft:effects/smeltery/moltenmetal


#> dev
# instabuild
execute as @e[nbt={Item:{tag:{TC_GuideBook:1b}}}] at @s if entity @e[nbt={Item:{id:"minecraft:command_block"}},distance=..1,sort=nearest,limit=1] unless entity @e[tag=TC_smeltery,distance=..15] align xyz run function tinkererscraft:root/others/instabuild