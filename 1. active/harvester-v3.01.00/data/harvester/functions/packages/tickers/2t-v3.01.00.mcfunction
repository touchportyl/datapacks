# run code every tick (20 times a second)
execute as @a at @s if predicate harvester:player_checkers/is_sneaking align xz positioned ~0.5 ~ ~0.5 run function harvester:root/main


# sweep effect once only after the function finishes
execute as @a[tag=HV_success] at @s run function harvester:effects/sweep


# gc
function harvester:root/garbage_collection



# simple "not so random-iser"
scoreboard players add RAND$4 Harvester 1
execute if score RAND$4 Harvester matches 4.. run scoreboard players set RAND$4 Harvester 1



# tick
schedule function harvester:packages/tickers/2t-v3.01.00 2t
