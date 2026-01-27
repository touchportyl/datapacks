# update happy ghast speeds
execute as @e[type=minecraft:happy_ghast,tag=SwiftGhast] \
  run function swiftghasts:update_speed

# loop
schedule function swiftghasts:update 1t