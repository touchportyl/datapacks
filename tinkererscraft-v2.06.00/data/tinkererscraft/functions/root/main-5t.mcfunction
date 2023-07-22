# the main controller that runs the entirety of tinkerers craft
# runs on 5t intervals


#> check > check_anvil
execute as @e[tag=TC_smeltery] at @s run function tinkererscraft:root/casting/output/check


#> casting_hazard
execute as @e[tag=TC_smeltery] at @s if block ^ ^ ^2 minecraft:lever[powered=true] positioned ^ ^ ^2 run function tinkererscraft:root/casting/hazard


#> item frame alignment
# aligns the anvil's item frame to always face outwards
execute as @e[tag=TC_smeltery,tag=TC_anvil] at @s run function tinkererscraft:root/smeltery/item_frame_alignment


#> guidebook hologram

# remove the hologram from the previous tick
kill @e[tag=TC_guideBlock]

# displays a hologram of the smeltery wherever the guidebook is dropped and the player sneaks
execute as @a if predicate tinkererscraft:player/is_sneaking at @s as @e[nbt={Item:{tag:{TC_GuideBook:1b}}},distance=..16,sort=nearest,limit=1] at @s unless entity @e[tag=TC_smeltery,distance=..15] run function tinkererscraft:root/guide/controller



#> particle effects
# ambient
execute as @e[tag=TC_smeltery] at @s run function tinkererscraft:effects/smeltery/ambient
# guidebook (OnGround)
execute as @e[nbt={Item:{tag:{TC_GuideBook:1b}},OnGround:1b}] at @s run function tinkererscraft:effects/enchants/guidebook