gamerule commandBlockOutput false


# initialize

scoreboard objectives remove DD_init
scoreboard objectives add DD_init dummy [{"text":"Initialize Checker for Dimensional Doors","color":"light_purple"}]


#> dimensional door identification number

scoreboard objectives add DD_doorID dummy
execute unless score DD_doorID.$current DD_doorID matches 1.. run scoreboard players set DD_doorID.$current DD_doorID 1


# loading

tellraw @a [{"text":""},{"text":"   ➥","color":"red","hoverEvent":{"action":"show_text","value":"Created by touchportal!"}},{"text":" Loading"},{"text":" [Dimensional Doors] ","color":"aqua","hoverEvent":{"action":"show_text","value":"The elegant solution to /sethome."}},{"text":"v1.3"}]

gamerule commandBlockOutput true
