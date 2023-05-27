# cleanup
tag @e remove SS_playerNearby

# player detection
execute as @e[tag=seaskipper,tag=npc] at @s if entity @a[distance=..4,limit=1,sort=nearest] run tag @s add SS_playerNearby



# if player nearby
execute as @e[tag=seaskipper,tag=npc,tag=SS_playerNearby] at @s run function seaskipper:npc/behaviors/generic/lookatplayer
execute as @e[tag=seaskipper,tag=npc,tag=SS_playerNearby] at @s run function seaskipper:npc/behaviors/generic/displayname


# else
execute as @e[tag=seaskipper,tag=npc,tag=!SS_playerNearby] at @s run function seaskipper:npc/behaviors/generic/lookattarget
execute as @e[tag=seaskipper,tag=npc,tag=!SS_playerNearby] at @s run function seaskipper:npc/behaviors/generic/hidename
