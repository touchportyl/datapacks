# guard: not riding happy ghast
execute unless entity @s[nbt={RootVehicle:{Entity:{id:"minecraft:happy_ghast"}}}] \
  run return fail

# tag the happy ghast to mark it as a swift ghast
execute on vehicle run tag @s add SwiftGhast

# reset its speed attribute to default
execute on vehicle run attribute @s minecraft:flying_speed base reset

# set its max speed depending on leash status
# count how many leashes are attached to the ghast
scoreboard players set VAR$leash.count SwiftGhasts 0
execute on vehicle on leasher run scoreboard players add VAR$leash.count SwiftGhasts 1

tag @s remove SG_leashed
execute on vehicle if score VAR$leash.count SwiftGhasts matches 1.. \
  run tag @s add SG_leashed

# log
function swiftghasts:log_message {"type":"Info","message":"Started riding happy ghast."}