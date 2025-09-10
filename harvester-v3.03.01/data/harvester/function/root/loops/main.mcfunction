# main game loop

# check if sneaking
execute if score VERSION$minecraft.current.minor DatapackManager matches 14 as @a[scores={HV_sneak_time=1..}] at @s align xz positioned ~0.5 ~ ~0.5 run function harvester:root/inventory/hoe
execute unless score VERSION$minecraft.current.minor DatapackManager matches 14 run function harvester:compatibility/predicates/is_sneaking

# sweep effect once only after the function finishes
execute as @a[tag=HV_success] at @s run function harvester:effects/sweep

# damage tool
# this runs at the end because we want to ensure all other actions are completed first
execute if score CONFIG$toolbreaking Harvester = BOOL$true DatapackManager as @a[gamemode=survival,tag=HV_success] at @s run function harvester:root/damagetool
execute if score CONFIG$toolbreaking Harvester = BOOL$true DatapackManager as @a[gamemode=adventure,tag=HV_success] at @s run function harvester:root/damagetool

# gc
execute as @a at @s run function harvester:root/garbage_collection


# simple "not so random-iser" for next loop
scoreboard players add RAND$4 Harvester 1
execute if score RAND$4 Harvester matches 4.. run scoreboard players set RAND$4 Harvester 1


# loop
execute if score LOOP$main.isActive Harvester = BOOL$true DatapackManager run schedule function harvester:root/loops/main 2t