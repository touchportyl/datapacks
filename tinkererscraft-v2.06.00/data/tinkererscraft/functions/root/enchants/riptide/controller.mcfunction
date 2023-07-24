# controls the riptide item's effects


# start timer
scoreboard players add @s TC_RiptideTimer 1

#pfx:crit
particle minecraft:crit ~ ~0.5 ~ 0.5 0.4 0.5 0.1 2 force

# timeline
execute as @s[scores={TC_RiptideTimer=1}] at @s run effect give @s minecraft:levitation 2 3 true
execute as @s[scores={TC_RiptideTimer=5}] at @s run playsound minecraft:block.conduit.attack.target player @a ~ ~ ~ 2 2 0

execute as @s[scores={TC_RiptideTimer=15}] at @s run function tinkererscraft:effects/enchants/riptide/slash
execute as @s[scores={TC_RiptideTimer=20}] at @s run function tinkererscraft:effects/enchants/riptide/slash
execute as @s[scores={TC_RiptideTimer=23}] at @s run function tinkererscraft:effects/enchants/riptide/slash

execute as @s[scores={TC_RiptideTimer=25}] at @s run playsound minecraft:block.conduit.deactivate player @a ~ ~ ~ 0.8 1 0
execute as @s[scores={TC_RiptideTimer=35..}] at @s run particle minecraft:explosion ~ ~ ~ 0 0 0 0 1 force
execute as @s[scores={TC_RiptideTimer=35..}] at @s run playsound minecraft:entity.generic.explode player @a ~ ~ ~ 1 2 0

#> loot_doubler
execute as @e[tag=TC_rip,scores={TC_RiptideTimer=35..}] run function tinkererscraft:root/enchants/riptide/loot_doubler

execute as @s[scores={TC_RiptideTimer=35..}] at @s run kill @s