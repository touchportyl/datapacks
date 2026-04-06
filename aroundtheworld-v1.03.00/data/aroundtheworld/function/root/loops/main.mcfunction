# main game loop

function aroundtheworld:root/boundsdetection

execute as @a[tag=AW_generate] at @s run function aroundtheworld:root/generate/ticker
execute as @a[tag=AW_generate_border] at @s run function aroundtheworld:root/generate/ticker_border

# loop
execute if score LOOP$main.isActive AroundTheWorld = BOOL$true DatapackManager run schedule function aroundtheworld:root/loops/main 1t