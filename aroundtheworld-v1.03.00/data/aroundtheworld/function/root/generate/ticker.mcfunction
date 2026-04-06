# timer
scoreboard players add @s AroundTheWorld 1

# move 1 step
execute if score @s AroundTheWorld >= CONFIG$generation.delay AroundTheWorld as @s at @s run function aroundtheworld:root/generate/step

# display actionbar
# - [x/138][z/75] -
title @s actionbar [{"text":"","color":"gold"},{"text":"- ["},{"score":{"name":"@s","objective":"AroundTheWorld"}},{"text":"/"},{"score":{"name":"CONFIG$generation.delay","objective":"AroundTheWorld"}},{"text":"] ["},{"score":{"name":"TRACKER$generate.step.x","objective":"AroundTheWorld"},"bold":true},{"text":"/138] ["},{"score":{"name":"TRACKER$generate.step.z","objective":"AroundTheWorld"},"bold":true},{"text":"/75"},{"text":"] -"}]