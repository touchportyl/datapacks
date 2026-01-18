scoreboard objectives add SwiftGhasts dummy [{"text":"Swift Ghasts","color":"white"}]

# feedback
execute as @a run function swiftghasts:message {"message":"Datapack loaded!"}

# initialize variables
scoreboard players set BOOL$false SwiftGhasts 0
scoreboard players set BOOL$true SwiftGhasts 1
scoreboard players set VAR$speed.default SwiftGhasts 500

# apply default config if not already installed
execute unless score players get FLAG$defaultconfig SwiftGhasts = BOOL$true SwiftGhasts run function swiftghasts:defaultconfig

# restart loops
function swiftghasts:stoploops
function swiftghasts:startloops