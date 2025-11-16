# check for two black concrete blocks behind the endermite to create a traffic light
# todo: do a more sophisticated check for the entire traffic light structure

execute if block ~ ~ ~-1 minecraft:black_concrete if block ~ ~1 ~-1 minecraft:black_concrete run summon armor_stand ~ ~ ~ {Tags:["EndermiteScriptFramework","trafficlight","x","north"],Rotation:[0.0f,0.0f],Invisible:1b,Invulnerable:1b,NoBasePlate:1b,NoGravity:1b,Marker:1b,DisabledSlots:4144959}

execute if block ~ ~ ~1 minecraft:black_concrete if block ~ ~1 ~1 minecraft:black_concrete run summon armor_stand ~ ~ ~ {Tags:["EndermiteScriptFramework","trafficlight","x","south"],Rotation:[180.0f,0.0f],Invisible:1b,Invulnerable:1b,NoBasePlate:1b,NoGravity:1b,Marker:1b,DisabledSlots:4144959}

execute if block ~1 ~ ~ minecraft:black_concrete if block ~1 ~1 ~ minecraft:black_concrete run summon armor_stand ~ ~ ~ {Tags:["EndermiteScriptFramework","trafficlight","x","east"],Rotation:[90.0f,0.0f],Invisible:1b,Invulnerable:1b,NoBasePlate:1b,NoGravity:1b,Marker:1b,DisabledSlots:4144959}

execute if block ~-1 ~ ~ minecraft:black_concrete if block ~-1 ~1 ~ minecraft:black_concrete run summon armor_stand ~ ~ ~ {Tags:["EndermiteScriptFramework","trafficlight","x","west"],Rotation:[270.0f,0.0f],Invisible:1b,Invulnerable:1b,NoBasePlate:1b,NoGravity:1b,Marker:1b,DisabledSlots:4144959}

# do the same but for the walk signal
execute if block ~ ~ ~-1 minecraft:black_concrete if block ~ ~1 ~-1 minecraft:andesite_wall run summon armor_stand ~ ~ ~ {Tags:["EndermiteScriptFramework","trafficlight","x","walksignal","north"],Rotation:[0.0f,0.0f],Invisible:1b,Invulnerable:1b,NoBasePlate:1b,NoGravity:1b,Marker:1b,DisabledSlots:4144959}

execute if block ~ ~ ~1 minecraft:black_concrete if block ~ ~1 ~1 minecraft:andesite_wall run summon armor_stand ~ ~ ~ {Tags:["EndermiteScriptFramework","trafficlight","x","walksignal","south"],Rotation:[180.0f,0.0f],Invisible:1b,Invulnerable:1b,NoBasePlate:1b,NoGravity:1b,Marker:1b,DisabledSlots:4144959}

execute if block ~1 ~ ~ minecraft:black_concrete if block ~1 ~1 ~ minecraft:andesite_wall run summon armor_stand ~ ~ ~ {Tags:["EndermiteScriptFramework","trafficlight","x","walksignal","east"],Rotation:[90.0f,0.0f],Invisible:1b,Invulnerable:1b,NoBasePlate:1b,NoGravity:1b,Marker:1b,DisabledSlots:4144959}

execute if block ~-1 ~ ~ minecraft:black_concrete if block ~-1 ~1 ~ minecraft:andesite_wall run summon armor_stand ~ ~ ~ {Tags:["EndermiteScriptFramework","trafficlight","x","walksignal","west"],Rotation:[270.0f,0.0f],Invisible:1b,Invulnerable:1b,NoBasePlate:1b,NoGravity:1b,Marker:1b,DisabledSlots:4144959}