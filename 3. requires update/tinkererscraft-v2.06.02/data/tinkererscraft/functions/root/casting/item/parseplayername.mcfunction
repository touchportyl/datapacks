#> text parser
# also ensures that the block in front of the UI glass is air

# place sign
setblock ^ ^1 ^2 minecraft:oak_sign replace

#> parser for 1.16 - 1.19
execute as @s at @s if score VERSION$minecraft.current DatapackManager matches 16..19 run function tinkererscraft:compatibility/casting/item/parser-mc1.16-1.19

#> parser for 1.20+
execute as @s at @s if score VERSION$minecraft.current DatapackManager matches 20.. run function tinkererscraft:compatibility/casting/item/parser-mc1.20

# remove sign
setblock ^ ^1 ^2 minecraft:air replace