# guard: not riding happy ghast
execute unless entity @s[nbt={RootVehicle:{Entity:{id:"minecraft:happy_ghast"}}}] \
  run return fail

# tag the happy ghast to mark it as a swift ghast
execute on vehicle run tag @s add SwiftGhast

# reset its speed attribute to default
execute on vehicle run attribute @s minecraft:flying_speed base reset

# log
function swiftghasts:log_message {"type":"Info","message":"Started riding happy ghast."}