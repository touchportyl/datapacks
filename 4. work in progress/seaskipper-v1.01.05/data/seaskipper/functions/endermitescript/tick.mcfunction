execute as @e[type=endermite,tag=!ES_ignore] at @s run function seaskipper:endermitescript/tagger

execute as @e[type=endermite,tag=ES_tagged] at @s run function seaskipper:endermitescript/parser


# loop
schedule function seaskipper:endermitescript/tick 1t