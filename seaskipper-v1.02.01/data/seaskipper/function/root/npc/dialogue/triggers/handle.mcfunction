# handle triggers

execute as @a[scores={z_ss_dlg_0001=1..}] at @s run function seaskipper:root/npc/dialogue/seaskipper/ayutthaya
execute as @a[scores={z_ss_dlg_0002=1..}] at @s run function seaskipper:root/npc/dialogue/seaskipper/westeria

execute as @a[scores={z_ss_dlg_0003=1..}] at @s run function seaskipper:root/warp/ayutthaya/asoka
execute as @a[scores={z_ss_dlg_0004=1..}] at @s run function seaskipper:root/warp/ayutthaya/mangystau

execute as @a run function seaskipper:root/npc/dialogue/triggers/disable
execute as @a run function seaskipper:root/npc/dialogue/triggers/enable