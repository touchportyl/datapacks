# get next available uid
function endermitescriptframework:scripts/drivablevehicles/uid/next

# catch error
execute if score ESF$vehicleID.current ESF_vehicleID matches -1 as @a run return run function endermitescriptframework:scripts/drivablevehicles/alerts/vehiclelimitsreached

# successfully got uid, proceed to spawn vehicle

# create model
function endermitescriptframework:scripts/drivablevehicles/vehicles/ground/cruzer/create

# tag everything with new so it's easy to select all the parts later
tag @e[tag=cruzer,distance=..1,tag=!has_uid] add new

# create interaction and seat
summon minecraft:interaction ~ ~ ~ {Tags:["vehicle_interactable","cruzer_interactable","new"], width:1.4f, height:1.2f}
summon minecraft:armor_stand ~ ~1.0 ~ {Tags:["vehicle_seat","cruzer_seat","new"],Marker:1b,Invisible:1b,NoGravity:1b}

# set uid
scoreboard players operation @e[tag=new] ESF_vehicleID = ESF$vehicleID.current ESF_vehicleID
tag @e[tag=new] add has_uid

# cleanup
tag @e remove new