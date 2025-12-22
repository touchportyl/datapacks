## move seat v2

# clone speed
execute as @e[tag=vehicle_seat,tag=has_uid] run scoreboard players operation @s ESF_vSpeed_ = @s ESF_vSpeed
execute as @e[tag=vehicle_seat,tag=has_uid] run scoreboard players operation @s ESF_vTurnAngle_ = @s ESF_vTurnAngle

# inputs
execute as @a[tag=vehicle_driver] at @s run function endermitescriptframework:scripts/drivablevehicles/inputtagger
# register new vehicles here
execute as @a[tag=vehicle_driver] at @s run function endermitescriptframework:scripts/drivablevehicles/vehicles/ground/cabriolet/inputs
execute as @a[tag=vehicle_driver] at @s run function endermitescriptframework:scripts/drivablevehicles/vehicles/ground/cruzer/inputs


# tick physics
# apply forward and backwards
execute as @e[tag=vehicle_seat,tag=has_uid] at @s if score @s ESF_vSpeed_ matches 1.. run function endermitescriptframework:scripts/drivablevehicles/movement/ground/forward
execute as @e[tag=vehicle_seat,tag=has_uid] at @s if score @s ESF_vSpeed_ matches ..-1 run function endermitescriptframework:scripts/drivablevehicles/movement/ground/backward


# apply turn only when moving
execute as @e[tag=vehicle_seat,tag=has_uid] at @s unless score @s ESF_vSpeed matches 0 if score @s ESF_vTurnAngle_ matches ..-1 run function endermitescriptframework:scripts/drivablevehicles/movement/ground/turn_left
execute as @e[tag=vehicle_seat,tag=has_uid] at @s unless score @s ESF_vSpeed matches 0 if score @s ESF_vTurnAngle_ matches 1.. run function endermitescriptframework:scripts/drivablevehicles/movement/ground/turn_right


# decay
# register new vehicles here
execute as @e[tag=cabriolet_seat,tag=has_uid] at @s run function endermitescriptframework:scripts/drivablevehicles/vehicles/ground/cabriolet/decay
execute as @e[tag=cruzer_seat,tag=has_uid] at @s run function endermitescriptframework:scripts/drivablevehicles/vehicles/ground/cruzer/decay

# limiter
# register new vehicles here
execute as @e[tag=cabriolet_seat,tag=has_uid] at @s run function endermitescriptframework:scripts/drivablevehicles/vehicles/ground/cabriolet/limiter
execute as @e[tag=cruzer_seat,tag=has_uid] at @s run function endermitescriptframework:scripts/drivablevehicles/vehicles/ground/cruzer/limiter

# reset
execute as @e[tag=vehicle_seat,tag=has_uid] run scoreboard players reset @s ESF_vSpeed_
execute as @e[tag=vehicle_seat,tag=has_uid] run scoreboard players reset @s ESF_vTurnAngle_


## position update
# each vehicle has its own unique offset so each vehicle will need its own update function
# register new vehicles here
function endermitescriptframework:scripts/drivablevehicles/vehicles/ground/cabriolet/update
function endermitescriptframework:scripts/drivablevehicles/vehicles/ground/cruzer/update



## interaction handling
execute as @e[tag=vehicle_interactable] at @s run function endermitescriptframework:scripts/drivablevehicles/interact


# sneak to get out
execute as @a[tag=vehicle_driver] at @s if predicate input:sneak run function endermitescriptframework:scripts/drivablevehicles/exit_vehicle



## click handling

# click to destroy vehicle
#execute as @e[tag=cruzer_interactable] at @s if data entity @s attack run function endermitescriptframework:scripts/drivablevehicles/vehicles/ground/cruzer/delete

# clear attack (handled regardless to avoid stuck state)
execute as @e[tag=vehicle_interactable] at @s run data remove entity @s attack


# vehicle sound and particle effects
execute as @a[tag=vehicle_driver] at @s run function endermitescriptframework:scripts/drivablevehicles/fx


# loop
schedule function endermitescriptframework:scripts/drivablevehicles/loops/update 1t