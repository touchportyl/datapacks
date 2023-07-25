# detects scoreboard triggers

scoreboard players enable @a TC_Give
execute if entity @a[scores={TC_Give=1..}] run function tinkererscraft:packages/triggers/give