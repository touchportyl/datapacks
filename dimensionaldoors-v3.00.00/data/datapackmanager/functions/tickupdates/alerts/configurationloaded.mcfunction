# notify
tellraw @a[tag=debug] [{"text":"","color":"gray","hoverEvent":{"action":"show_text","value":"Alert generated by Datapack Manager"}},{"text":"\n ALERT","color":"gold","bold":"true"},{"text":"\n Loaded the updated configuration file from memory.\n"}]
title @a actionbar {"text":"Config loaded!"}
execute as @a at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 2 1
