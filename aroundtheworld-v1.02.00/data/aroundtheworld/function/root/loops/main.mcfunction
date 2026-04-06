# main game loop

function aroundtheworld:root/boundsdetection

# loop
execute if score LOOP$main.isActive AroundTheWorld = BOOL$true DatapackManager run schedule function aroundtheworld:root/loops/main 1t