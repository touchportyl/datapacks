execute as @e[type=minecraft:trident,tag=!portyltrident] at @s if entity @a[name="touchportyl",distance=..3] run function portyltrident:core/execute/trident/detect



# loop
schedule function portyltrident:core/tick 1t