# main game loop

# detect tridents
execute as @e[type=minecraft:trident,tag=!PortylTrident] at @s if entity @a[name="touchportyl",distance=..3] run function portyltrident:root/trident/detect


# loop
execute if score LOOP$main.isActive PortylTrident = BOOL$true DatapackManager run schedule function portyltrident:root/loops/main 1t