# right click
execute as @a at @s if score @s SS_TalkedToVillager matches 1.. run function seaskipper:root/talktovillager

# npc behaviors
function seaskipper:root/npc/rules/playernearby

# loop
schedule function seaskipper:root/1t 1t