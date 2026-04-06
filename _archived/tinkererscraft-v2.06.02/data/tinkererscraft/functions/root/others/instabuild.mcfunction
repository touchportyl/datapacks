
# fuel layer
fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 lava replace

# base layer
fill ~-1 ~ ~-1 ~1 ~ ~1 polished_blackstone_bricks replace
setblock ~ ~ ~ gilded_blackstone replace

# control layer
fill ~-1 ~1 ~-1 ~1 ~1 ~1 polished_blackstone_bricks replace
setblock ~ ~1 ~1 chiseled_polished_blackstone replace
setblock ~ ~1 ~2 lever[facing=south] replace
setblock ~ ~1 ~ air replace

# display layer
fill ~-1 ~2 ~-1 ~1 ~2 ~1 polished_blackstone_bricks replace
setblock ~ ~2 ~1 black_stained_glass replace
setblock ~ ~2 ~ air replace

# top layer
fill ~-1 ~3 ~-1 ~1 ~3 ~1 polished_blackstone_brick_slab replace
setblock ~ ~3 ~ air replace

# cleanup
execute at @s run kill @e[nbt={Item:{id:"minecraft:command_block"}},distance=..1,sort=nearest,limit=1]
kill @s