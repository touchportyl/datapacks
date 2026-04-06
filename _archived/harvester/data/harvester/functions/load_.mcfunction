gamerule commandBlockOutput false


# initialize
scoreboard objectives remove H_init
scoreboard objectives add H_init dummy [{"text":"Initialize Checker for Harvester","color":"green"}]

scoreboard objectives add H_sneak_time minecraft.custom:minecraft.sneak_time [{"text":"Sneak Detection for Harvester","color":"green"}]
scoreboard objectives add H_rand_2 dummy [{"text":"Randomizer (2) for Harvester","color":"green"}]


# loading

tellraw @a [{"text":""},{"text":"   ➥","color":"red","hoverEvent":{"action":"show_text","value":"Created by touchportal!"}},{"text":" Loading"},{"text":" [Harvester] ","color":"aqua","hoverEvent":{"action":"show_text","value":"Adding utility to hoes!"}},{"text":"v1.3"}]


gamerule commandBlockOutput true
