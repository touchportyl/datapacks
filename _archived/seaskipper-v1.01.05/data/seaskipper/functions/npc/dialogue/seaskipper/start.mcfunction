scoreboard players set @s dialogueTracker 1
execute at @s as @e[tag=seaskipper,tag=npc,distance=..4,sort=nearest,limit=1] run playsound entity.villager.yes neutral @a ~ ~ ~ 1 0.7 0

tellraw @s {"text":""}
tellraw @s {"text":""}
tellraw @s {"text":""}
tellraw @s {"text":""}
tellraw @s {"text":""}
tellraw @s [{"text":"Seaskipper: ","color":"dark_green"},{"text":"Looking for a ride? I'll take you to any port around the world!","color":"green"}]
tellraw @s {"text":""}

tellraw @s {"text":""}
tellraw @s [{"text":"","clickEvent":{"action":"run_command","value":"/function seaskipper:npc/dialogue/seaskipper/ayutthaya"}},{"text":"  >> Travel to locations in ","color":"white"},{"text":"Ayutthaya","color":"gold","underlined":true}]
tellraw @s {"text":""}
tellraw @s [{"text":"","clickEvent":{"action":"run_command","value":"/function seaskipper:npc/dialogue/seaskipper/westeria"}},{"text":"  >> Travel to locations in ","color":"white"},{"text":"Westeria","color":"gold","underlined":true}]
tellraw @s {"text":""}

