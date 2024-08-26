# main game loop

# tag all endermites for processing
tag @e[type=minecraft:endermite,tag=!ES_ignore] add ES_tagged

# process tagged endermites
execute as @e[type=minecraft:endermite,tag=ES_tagged] run function mydatapack:packages/endermitescript/root/parser


# loop
execute if score LOOP$main.isActive MyDatapack = BOOL$true DatapackManager run schedule function mydatapack:packages/endermitescript/loops/main 3t