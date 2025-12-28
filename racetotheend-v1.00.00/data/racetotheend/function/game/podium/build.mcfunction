# clean up the portal
fill ~4 ~-3 ~4 ~-4 100 ~-4 minecraft:air replace

#> build the podium

fill ~1 ~-1 ~1 ~-1 ~-1 ~-1 minecraft:stone_slab replace
fill ~1 ~-1 ~ ~-1 ~-1 ~ minecraft:chiseled_stone_bricks replace
fill ~ ~-1 ~1 ~ ~-1 ~-1 minecraft:chiseled_stone_bricks replace

fill ~3 ~-2 ~ ~-3 ~-2 ~ minecraft:end_rod replace
fill ~ ~-2 ~3 ~ ~-2 ~-3 minecraft:end_rod replace
fill ~2 ~-2 ~2 ~-2 ~-2 ~-2 minecraft:end_rod replace
fill ~1 ~-2 ~2 ~-1 ~-2 ~-2 minecraft:smooth_quartz_slab replace
fill ~2 ~-2 ~1 ~-2 ~-2 ~-1 minecraft:smooth_quartz_slab replace
fill ~ ~-2 ~2 ~ ~-2 ~-2 minecraft:smooth_quartz replace
fill ~2 ~-2 ~ ~-2 ~-2 ~ minecraft:smooth_quartz replace
fill ~1 ~-2 ~1 ~-1 ~-2 ~-1 minecraft:smooth_quartz replace

fill ~3 ~-3 ~1 ~-3 ~-3 ~-1 minecraft:stone_slab replace
fill ~1 ~-3 ~3 ~-1 ~-3 ~-3 minecraft:stone_slab replace
fill ~3 ~-3 ~ ~-3 ~-3 ~ minecraft:andesite_wall replace
fill ~ ~-3 ~3 ~ ~-3 ~-3 minecraft:andesite_wall replace
fill ~2 ~-3 ~2 ~-2 ~-3 ~-2 minecraft:andesite_wall replace
fill ~1 ~-3 ~2 ~-1 ~-3 ~-2 minecraft:smooth_quartz_slab replace
fill ~2 ~-3 ~1 ~-2 ~-3 ~-1 minecraft:smooth_quartz_slab replace
fill ~1 ~-3 ~1 ~-1 ~-3 ~-1 minecraft:sea_lantern replace

setblock ~ ~-1 ~ minecraft:gold_block replace

# rebuild the bedrock middle
fill ~ ~-2 ~ ~ ~-4 ~ minecraft:bedrock replace