# the main controller that runs the entirety of tinkerers craft
# runs on 5t intervals


#> item frame alignment
# aligns the anvil's item frame to always face outwards
# it's just for looks
execute as @e[tag=TC_smeltery,tag=TC_anvil] at @s run function tinkererscraft:root/smeltery/item_frame_alignment


#> casting_hazard
execute as @e[tag=TC_smeltery] at @s if block ^ ^ ^2 minecraft:lever[powered=true] positioned ^ ^ ^2 run function tinkererscraft:root/casting/hazard


#> guidebook visualization
execute if score VERSION$minecraft.current DatapackManager matches 17..20 run function tinkererscraft:root/guide/visualization


#> particle effects
# ambient
execute as @e[tag=TC_smeltery] at @s run function tinkererscraft:effects/smeltery/ambient
# guidebook (OnGround)
execute as @e[nbt={Item:{tag:{TC_GuideBook:1b}},OnGround:1b}] at @s run function tinkererscraft:effects/enchants/guidebook