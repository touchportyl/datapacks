# 1.13 compatibile
execute if score FLAG$dirty DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.21:root/listeners

scoreboard players add TICK$1s DatapackManager 1
execute if score TICK$1s DatapackManager matches 20.. run scoreboard players operation FLAG$dirty DatapackManager = BOOL$true DatapackManager