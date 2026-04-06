# main game loop

# tag all endermites for processing
tag @e[type=minecraft:endermite,tag=!ES_ignore] add ES_tagged

# process tagged endermites
execute as @e[tag=ES_tagged] at @s run function seaskipper:packages/endermitescript/root/parser


# loop
execute if score LOOP$main.isActive Seaskipper = BOOL$true DatapackManager run schedule function seaskipper:packages/endermitescript/loops/main 3t