# controls the timeline for the lunge skill


execute as @s[scores={TC_LungeTimer=5}] at @s run function tinkererscraft:root/enchants/lunge/status_1
execute as @s[scores={TC_LungeTimer=20}] at @s run function tinkererscraft:root/enchants/lunge/status_2
execute as @s[scores={TC_LungeTimer=35}] at @s run function tinkererscraft:root/enchants/lunge/status_3
execute as @s[scores={TC_LungeTimer=35..}] at @s run function tinkererscraft:root/enchants/lunge/status_4
execute as @e[scores={TC_LungeTimer=36..}] at @s if predicate tinkererscraft:player/is_sneaking_ run function tinkererscraft:effects/enchants/heated
execute as @e[scores={TC_LungeTimer=36..40}] at @s if predicate tinkererscraft:player/is_sneaking_ run function tinkererscraft:root/enchants/lunge/skill_tech