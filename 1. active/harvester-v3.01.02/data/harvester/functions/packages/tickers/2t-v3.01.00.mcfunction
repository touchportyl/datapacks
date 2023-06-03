# run code every tick (20 times a second)

# check if sneaking
execute if score VERSION$minecraft.current DatapackManager matches 14 as @a[scores={HV_sneak_time=1..}] at @s align xz positioned ~0.5 ~ ~0.5 run function harvester:root/main
execute unless score VERSION$minecraft.current DatapackManager matches 14 run function harvester:compatibility/predicates/is_sneaking


# sweep effect once only after the function finishes
execute as @a[tag=HV_success] at @s run function harvester:effects/sweep


# gc
function harvester:root/garbage_collection



# simple "not so random-iser"
scoreboard players add RAND$4 Harvester 1
execute if score RAND$4 Harvester matches 4.. run scoreboard players set RAND$4 Harvester 1



# tick
execute unless score LOOP$tickers.2t.isLooping Harvester = BOOL$false DatapackManager run schedule function harvester:packages/tickers/2t-v3.01.00 2t
