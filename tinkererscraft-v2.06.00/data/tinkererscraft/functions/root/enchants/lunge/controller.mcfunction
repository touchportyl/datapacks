# controls the timeline for the lunge skill

# lunge ticks up at 1tps while the controller runs at 2tps
# so all tests cover 2 values


execute as @s[scores={TC_LungeTimer=5..6}] at @s run function tinkererscraft:effects/enchants/lunge/status/1
execute as @s[scores={TC_LungeTimer=20..21}] at @s run function tinkererscraft:effects/enchants/lunge/status/2
execute as @s[scores={TC_LungeTimer=35..36}] at @s run function tinkererscraft:effects/enchants/lunge/status/3
execute as @s[scores={TC_LungeTimer=35..}] at @s run function tinkererscraft:effects/enchants/lunge/status/4

execute as @e[scores={TC_LungeTimer=36..}] at @s if predicate tinkererscraft:player/is_sneaking run scoreboard players add @s TC_SmeltingTimer 2

execute as @e[scores={TC_LungeTimer=36..42}] at @s if predicate tinkererscraft:player/is_sneaking_ run function tinkererscraft:root/enchants/lunge/skill_tech