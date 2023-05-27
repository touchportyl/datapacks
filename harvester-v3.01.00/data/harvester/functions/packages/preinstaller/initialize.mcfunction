tellraw @a[tag=hv_debug] [{"text":"HV","color":"gold"},{"text":" > packages/preinstaller/initialize.mcfunction","color":"gray"}]

# create master scoreboard
# WARNING: THIS COMMAND MUST RUN BEFORE ANYTHING ELSE
scoreboard objectives add Harvester dummy [{"text":"Harvester","color":"gold"}]



# load config
scoreboard players operation FUNCTION$loadconfig Harvester = BOOL$true DatapackManager
# force to run inline
function harvester:packages/slowupdates/update

# check datapack version
# don't need to check if the current config version is already the latest
# updates only have to run if the current version is later than the latest
execute unless score VERSION$datapack.current Harvester = VERSION$datapack.latest Harvester run function harvester:packages/versioning/check

# install
execute unless score FLAG$secret Harvester = FLAG$secret DatapackManager run function harvester:installer-v3.01.00



# start tickers
scoreboard players operation LOOP$tickers.2t.isLooping Harvester = BOOL$true DatapackManager
scoreboard players operation LOOP$tickers.1s.isLooping Harvester = BOOL$true DatapackManager
scoreboard players operation FLAG$dirty Harvester = BOOL$true DatapackManager



# hooks
execute if score CONFIG$hooks.isEnabled Harvester = BOOL$true DatapackManager run function harvester:packages/hooks/enable
execute if score CONFIG$hooks.isEnabled Harvester = BOOL$false DatapackManager run function harvester:packages/hooks/disable