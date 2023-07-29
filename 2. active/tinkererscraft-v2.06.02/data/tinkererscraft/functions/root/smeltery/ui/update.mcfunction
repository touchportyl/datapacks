# updates the ore displays

execute as @s[tag=TC_outputiron] at @s positioned ^ ^0.6 ^1 run data modify entity @e[tag=TC_display,tag=TC_ore,distance=..1,limit=1] CustomName set value '{"text":"Iron","color":"gray"}'
execute as @s[tag=TC_outputgold] at @s positioned ^ ^0.6 ^1 run data modify entity @e[tag=TC_display,tag=TC_ore,distance=..1,limit=1] CustomName set value '{"text":"Gold","color":"yellow"}'
execute as @s[tag=TC_outputobsidian] at @s positioned ^ ^0.6 ^1 run data modify entity @e[tag=TC_display,tag=TC_ore,distance=..1,limit=1] CustomName set value '{"text":"Obsidian","color":"dark_gray"}'
execute as @s[tag=TC_outputirgol] at @s positioned ^ ^0.6 ^1 run data modify entity @e[tag=TC_display,tag=TC_ore,distance=..1,limit=1] CustomName set value '{"text":"Irgol","color":"gold"}'
execute as @s[tag=TC_outputobdiam] at @s positioned ^ ^0.6 ^1 run data modify entity @e[tag=TC_display,tag=TC_ore,distance=..1,limit=1] CustomName set value '{"text":"Obdiam","color":"dark_red"}'


#> text parser
# also ensures that the block in front of the UI glass is air

# place sign
setblock ^ ^1 ^2 minecraft:oak_sign replace

#> parser for 1.16 - 1.19
execute as @s at @s if score VERSION$minecraft.current DatapackManager matches 16..19 run function tinkererscraft:compatibility/smeltery/ui/parser-mc1.16-1.19

#> parser for 1.20+
execute as @s at @s if score VERSION$minecraft.current DatapackManager matches 20.. run function tinkererscraft:compatibility/smeltery/ui/parser-mc1.20

# remove sign
setblock ^ ^1 ^2 minecraft:air replace