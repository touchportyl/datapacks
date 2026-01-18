# as each ghast
# 1. skip if not being ridden
# 2. get speed from attribute
# 3. increase speed value if rider is pressing forward
# 4. decrease speed value if rider not pressing forward
# 5. clamp speed value to [default, max]
# 6. store speed value in storage
# 7. apply speed value to flying_speed attribute

function swiftghasts:remove_contexts

# set up contexts
tag @s add SG_ctx_vehicle
execute on controller run tag @s add SG_ctx_controller

# 1. skip if not being ridden
execute unless entity @n[tag=SG_ctx_controller] \
  run return run function swiftghasts:no_rider
  #run return run execute as @a run function swiftghasts:log_message {"type":"Warning","message":"Happy Ghast has no controller, skipping speed update."}

# 2. get speed from attribute
execute store result score @n[tag=SG_ctx_vehicle] SwiftGhasts \
  run attribute @n[tag=SG_ctx_vehicle] minecraft:flying_speed base get 10000

# 3. increase speed value if rider is pressing forward
# Priority order: forward/backward > left/right + jump
execute as @n[tag=SG_ctx_controller] \
  if predicate input:forward \
  unless predicate input:backward \
  run scoreboard players operation @n[tag=SG_ctx_vehicle] SwiftGhasts += VAR$speed.control.forward SwiftGhasts
execute as @n[tag=SG_ctx_controller] \
  unless predicate input:forward \
  if predicate input:backward \
  run scoreboard players operation @n[tag=SG_ctx_vehicle] SwiftGhasts += VAR$speed.control.backward SwiftGhasts
execute as @n[tag=SG_ctx_controller] \
  unless predicate input:forward \
  unless predicate input:backward \
  if predicate input:left \
  unless predicate input:right \
  run scoreboard players operation @n[tag=SG_ctx_vehicle] SwiftGhasts += VAR$speed.control.strafe SwiftGhasts
execute as @n[tag=SG_ctx_controller] \
  unless predicate input:forward \
  unless predicate input:backward \
  unless predicate input:left \
  if predicate input:right \
  run scoreboard players operation @n[tag=SG_ctx_vehicle] SwiftGhasts += VAR$speed.control.strafe SwiftGhasts
execute as @n[tag=SG_ctx_controller] \
  if predicate input:jump \
  run scoreboard players operation @n[tag=SG_ctx_vehicle] SwiftGhasts += VAR$speed.control.up SwiftGhasts

# 4. decrease speed value if rider not pressing anything or when inputting opposite directions
execute as @n[tag=SG_ctx_controller] \
  unless predicate input:forward \
  unless predicate input:backward \
  unless predicate input:left \
  unless predicate input:right \
  unless predicate input:jump \
  run scoreboard players operation @n[tag=SG_ctx_vehicle] SwiftGhasts -= VAR$speed.control.deceleration SwiftGhasts
execute as @n[tag=SG_ctx_controller] \
  if predicate input:forward \
  if predicate input:backward \
  unless predicate input:left \
  unless predicate input:right \
  unless predicate input:jump \
  run scoreboard players operation @n[tag=SG_ctx_vehicle] SwiftGhasts -= VAR$speed.control.deceleration SwiftGhasts
execute as @n[tag=SG_ctx_controller] \
  unless predicate input:forward \
  unless predicate input:backward \
  if predicate input:left \
  if predicate input:right \
  unless predicate input:jump \
  run scoreboard players operation @n[tag=SG_ctx_vehicle] SwiftGhasts -= VAR$speed.control.deceleration SwiftGhasts

# 5. clamp speed value to [default, max]
execute if score @n[tag=SG_ctx_vehicle] SwiftGhasts > VAR$speed.max SwiftGhasts \
  run scoreboard players operation @n[tag=SG_ctx_vehicle] SwiftGhasts = VAR$speed.max SwiftGhasts
execute if score @n[tag=SG_ctx_vehicle] SwiftGhasts < VAR$speed.default SwiftGhasts \
  run scoreboard players operation @n[tag=SG_ctx_vehicle] SwiftGhasts = VAR$speed.default SwiftGhasts

# 6. store speed value in storage
execute store result storage swiftghasts:data speed double 0.0001 \
  run scoreboard players get @n[tag=SG_ctx_vehicle] SwiftGhasts

# 7. apply speed value to flying_speed attribute
function swiftghasts:apply_speed with storage swiftghasts:data

function swiftghasts:remove_contexts