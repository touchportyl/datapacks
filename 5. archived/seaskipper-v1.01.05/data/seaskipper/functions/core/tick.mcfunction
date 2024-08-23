# right click
execute as @a at @s if score @s talkedToVillager matches 1.. run function seaskipper:core/execute/talktovillager

# npc behaviors
function seaskipper:npc/rules/playernearby


# loop
schedule function seaskipper:core/tick 1t