tellraw @a[tag=hv_debug] [{"text":"HV","color":"gold"},{"text":" > packages/preinstaller/initialize.mcfunction","color":"gray"}]

# create master scoreboard
# WARNING: THIS COMMAND MUST RUN BEFORE ANYTHING ELSE
scoreboard objectives add Harvester dummy [{"text":"Harvester","color":"gold"}]



# load config
scoreboard players operation FUNCTION$loadconfig Harvester = BOOL$true DatapackManager
# force to run inline
function harvester:packages/slowupdates/update

# install
# only install if hasn't been installed before
execute unless score FLAG$secret Harvester = FLAG$secret DatapackManager run function harvester:installer-v3.01.00

# check datapack version
# don't need to check if the current config version is already the latest
# updates only have to run if the current version is later than the latest
execute unless score VERSION$datapack.current Harvester = VERSION$datapack.latest Harvester run function harvester:packages/versioning/check



# compatibility

# no predicates in mc1.14.00
execute if score VERSION$minecraft.current DatapackManager matches 14 run scoreboard objectives add HV_sneak_time minecraft.custom:minecraft.sneak_time [{"text":"Sneak Detection for Harvester","color":"gold"}]
execute unless score VERSION$minecraft.current DatapackManager matches 14 run scoreboard objectives remove HV_sneak_time


# start tickers
scoreboard players operation LOOP$tickers.2t.isLooping Harvester = BOOL$true DatapackManager
scoreboard players operation LOOP$tickers.1s.isLooping Harvester = BOOL$true DatapackManager
scoreboard players operation FLAG$dirty Harvester = BOOL$true DatapackManager



# hooks
execute if score CONFIG$hooks.isEnabled Harvester = BOOL$true DatapackManager run function harvester:packages/hooks/enable
execute if score CONFIG$hooks.isEnabled Harvester = BOOL$false DatapackManager run function harvester:packages/hooks/disable