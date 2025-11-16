scoreboard players operation ESF$tmp ESF_vehicleID = @s ESF_vehicleID

# clear previous input tags
tag @e[tag=vehicle_input_forward] remove vehicle_input_forward
tag @e[tag=vehicle_input_backward] remove vehicle_input_backward
tag @e[tag=vehicle_input_left] remove vehicle_input_left
tag @e[tag=vehicle_input_right] remove vehicle_input_right
tag @e[tag=vehicle_input_sneak] remove vehicle_input_sneak
tag @e[tag=vehicle_input_jump] remove vehicle_input_jump
tag @e[tag=vehicle_input_sprint] remove vehicle_input_sprint

tag @e[tag=vehicle_input_forward_backward] remove vehicle_input_forward_backward
tag @e[tag=vehicle_input_left_right] remove vehicle_input_left_right
tag @e[tag=vehicle_input_forward_backward_left_right] remove vehicle_input_forward_backward_left_right

# apply tags based on inputs
execute if predicate input:forward as @e[tag=vehicle_seat,tag=has_uid] if score @s ESF_vehicleID = ESF$tmp ESF_vehicleID at @s run tag @s add vehicle_input_forward
execute if predicate input:backward as @e[tag=vehicle_seat,tag=has_uid] if score @s ESF_vehicleID = ESF$tmp ESF_vehicleID at @s run tag @s add vehicle_input_backward
execute if predicate input:left as @e[tag=vehicle_seat,tag=has_uid] if score @s ESF_vehicleID = ESF$tmp ESF_vehicleID at @s run tag @s add vehicle_input_left
execute if predicate input:right as @e[tag=vehicle_seat,tag=has_uid] if score @s ESF_vehicleID = ESF$tmp ESF_vehicleID at @s run tag @s add vehicle_input_right
execute if predicate input:sneak as @e[tag=vehicle_seat,tag=has_uid] if score @s ESF_vehicleID = ESF$tmp ESF_vehicleID at @s run tag @s add vehicle_input_sneak
execute if predicate input:jump as @e[tag=vehicle_seat,tag=has_uid] if score @s ESF_vehicleID = ESF$tmp ESF_vehicleID at @s run tag @s add vehicle_input_jump
execute if predicate input:sprint as @e[tag=vehicle_seat,tag=has_uid] if score @s ESF_vehicleID = ESF$tmp ESF_vehicleID at @s run tag @s add vehicle_input_sprint

# compound tags
tag @e[tag=vehicle_seat,tag=has_uid,tag=vehicle_input_forward] add vehicle_input_forward_backward
tag @e[tag=vehicle_seat,tag=has_uid,tag=vehicle_input_backward] add vehicle_input_forward_backward

tag @e[tag=vehicle_seat,tag=has_uid,tag=vehicle_input_left] add vehicle_input_left_right
tag @e[tag=vehicle_seat,tag=has_uid,tag=vehicle_input_right] add vehicle_input_left_right

tag @e[tag=vehicle_seat,tag=has_uid,tag=vehicle_input_forward_backward] add vehicle_input_forward_backward_left_right
tag @e[tag=vehicle_seat,tag=has_uid,tag=vehicle_input_left_right] add vehicle_input_forward_backward_left_right