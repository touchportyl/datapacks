# notify
tellraw @a[tag=debug] [{"text":"","color":"gray","hoverEvent":{"action":"show_text","value":"Warning generated by Datapack Manager"}},{"text":"\n WARNING","color":"red","bold":"true"},{"text":"\n This world used to run an updated version of this datapack. Features added in future versions will not run on this version.\n"}]
title @a actionbar {"text":"Old datapack version detected!"}
execute as @a at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 2 1
