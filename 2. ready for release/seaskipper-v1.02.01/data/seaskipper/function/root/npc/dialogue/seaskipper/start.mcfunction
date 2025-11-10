scoreboard players set @s SS_DialogueTracker 1
execute at @s as @e[tag=Seaskipper,tag=SS_npc,distance=..4,sort=nearest,limit=1] run function seaskipper:effects/villager/start

tellraw @s {"text":""}
tellraw @s {"text":""}
tellraw @s {"text":""}
tellraw @s {"text":""}
tellraw @s {"text":""}
tellraw @s [{"text":"Seaskipper: ","color":"dark_green"},{"text":"Looking for a ride? I'll take you to any port around the world!","color":"green"}]
tellraw @s {"text":""}

tellraw @s {"text":""}
tellraw @s [{"text":"","click_event":{"action":"run_command","command":"/trigger z_ss_dlg_0001"}},{"text":"  >> Travel to locations in ","color":"white"},{"text":"Ayutthaya","color":"gold","underlined":true}]
tellraw @s {"text":""}
tellraw @s [{"text":"","click_event":{"action":"run_command","command":"/trigger z_ss_dlg_0002"}},{"text":"  >> Travel to locations in ","color":"white"},{"text":"Westeria","color":"gold","underlined":true}]
tellraw @s {"text":""}