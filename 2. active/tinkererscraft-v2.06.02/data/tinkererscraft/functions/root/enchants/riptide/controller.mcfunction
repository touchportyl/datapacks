# controls the riptide item's effects


# start timer
scoreboard players add @s TC_RiptideTimer 1

#pfx:crit
function tinkererscraft:effects/enchants/riptide/crit

# timeline
execute as @s[scores={TC_RiptideTimer=1}] at @s run function tinkererscraft:effects/enchants/riptide/attack

execute as @s[scores={TC_RiptideTimer=15}] at @s run function tinkererscraft:effects/enchants/riptide/slash
execute as @s[scores={TC_RiptideTimer=20}] at @s run function tinkererscraft:effects/enchants/riptide/slash
execute as @s[scores={TC_RiptideTimer=23}] at @s run function tinkererscraft:effects/enchants/riptide/slash

execute as @s[scores={TC_RiptideTimer=25}] at @s run function tinkererscraft:effects/enchants/riptide/bassdrop
execute as @s[scores={TC_RiptideTimer=35..}] at @s run function tinkererscraft:effects/generic/explosion
execute as @s[scores={TC_RiptideTimer=35..}] at @s run function tinkererscraft:effects/enchants/riptide/explosion

#> loot_doubler
execute as @e[tag=TC_rip,scores={TC_RiptideTimer=35..}] run function tinkererscraft:root/enchants/riptide/loot_doubler

execute as @s[scores={TC_RiptideTimer=35..}] at @s run kill @s