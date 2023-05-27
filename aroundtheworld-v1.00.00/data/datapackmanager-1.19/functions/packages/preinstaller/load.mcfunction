tellraw @a[tag=dm_debug] [{"text":"DM","color":"white"},{"text":" > packages/preinstaller/load.mcfunction","color":"gray"}]

# create master scoreboard
# WARNING: THIS COMMAND MUST RUN BEFORE ANYTHING ELSE
scoreboard objectives add DatapackManager dummy [{"text":"Datapack Manager","color":"white"}]

# initialize
# the first manager that runs will disable all other managers
execute unless score FLAG$first DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.19:packages/preinstaller/initialize