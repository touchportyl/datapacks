# main game loop

# right click
execute as @a at @s if score @s SS_TalkedToVillager matches 1.. run function seaskipper:root/talktovillager

# npc behaviors
function seaskipper:root/npc/rules/playernearby


# loop
execute if score LOOP$main.isActive Seaskipper = BOOL$true DatapackManager run schedule function seaskipper:root/loops/main 1t