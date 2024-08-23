# cleanup
tag @e remove SS_playernearby

# player detection
execute as @e[tag=Seaskipper,tag=SS_npc] at @s if entity @a[distance=..4,limit=1,sort=nearest] run tag @s add SS_playernearby


# if player nearby
execute as @e[tag=Seaskipper,tag=SS_npc,tag=SS_playernearby] at @s run function seaskipper:root/npc/behaviors/generic/lookatplayer
execute as @e[tag=Seaskipper,tag=SS_npc,tag=SS_playernearby] at @s run function seaskipper:root/npc/behaviors/generic/displayname

# else
execute as @e[tag=Seaskipper,tag=SS_npc,tag=!SS_playernearby] at @s run function seaskipper:root/npc/behaviors/generic/lookattarget
execute as @e[tag=Seaskipper,tag=SS_npc,tag=!SS_playernearby] at @s run function seaskipper:root/npc/behaviors/generic/hidename