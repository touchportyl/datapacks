# controls the flaming item's particle display


# start timer
scoreboard players add @s TC_FlamingTimer 1

#pfx:flaming_circle_1
execute as @e[scores={TC_FlamingTimer=35}] at @s run function tinkererscraft:effects/enchants/flaming/circle_1

#pfx:flaming_circle_2
execute as @e[scores={TC_FlamingTimer=50}] at @s run function tinkererscraft:effects/enchants/flaming/circle_2

#todo:gc
execute as @e[scores={TC_FlamingTimer=50}] at @s run scoreboard players reset @s TC_FlamingTimer
tag @s remove TC_isFlaming