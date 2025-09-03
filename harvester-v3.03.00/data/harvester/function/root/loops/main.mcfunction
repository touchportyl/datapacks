# main game loop

# classify
function harvester:root/inventory/range

# check for seeds
function harvester:root/inventory/seeds

# filter > positioner > controller
execute if entity @s[x_rotation=0..90] run function harvester:root/positioner/filter

# check if sneaking
execute if score VERSION$minecraft.current.minor DatapackManager matches 14 as @a[scores={HV_sneak_time=1..}] at @s align xz positioned ~0.5 ~ ~0.5 run function harvester:root/inventory/hoe
execute unless score VERSION$minecraft.current.minor DatapackManager matches 14 run function harvester:compatibility/predicates/is_sneaking

# sweep effect once only after the function finishes
execute as @a[tag=HV_success] at @s run function harvester:effects/sweep

# gc
function harvester:root/garbage_collection

# simple "not so random-iser" for next loop
scoreboard players add RAND$4 Harvester 1
execute if score RAND$4 Harvester matches 4.. run scoreboard players set RAND$4 Harvester 1


# loop
execute if score LOOP$main.isActive Harvester = BOOL$true DatapackManager run schedule function harvester:root/loops/main 2t