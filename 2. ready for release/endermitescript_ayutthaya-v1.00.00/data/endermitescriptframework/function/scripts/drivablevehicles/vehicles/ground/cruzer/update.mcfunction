# lock parts to root — dispatch per root
execute as @e[tag=cruzer_root,tag=has_uid] at @s run function endermitescriptframework:scripts/drivablevehicles/vehicles/ground/cruzer/lock_parts_to_root

# lock interaction to seat — dispatch per seat
execute as @e[tag=cruzer_seat,tag=has_uid] at @s run function endermitescriptframework:scripts/drivablevehicles/vehicles/ground/cruzer/lock_interactions_to_seat

# lock root to seat — dispatch per seat (root follows seat)
execute as @e[tag=cruzer_seat,tag=has_uid] at @s run function endermitescriptframework:scripts/drivablevehicles/vehicles/ground/cruzer/lock_root_to_seat