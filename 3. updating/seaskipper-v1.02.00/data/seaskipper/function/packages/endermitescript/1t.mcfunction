execute as @e[type=endermite,tag=!ES_ignore] at @s run function seaskipper:packages/endermitescript/tagger

execute as @e[type=endermite,tag=ES_tagged] at @s run function seaskipper:packages/endermitescript/parser


# loop
schedule function seaskipper:packages/endermitescript/1t 1t