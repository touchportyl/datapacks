tellraw @a[tag=tc_debug] [{"text":"TC","color":"gold"},{"text":" > packages/preinstaller/initialize.mcfunction","color":"gray"}]

# create master scoreboard
# WARNING: THIS COMMAND MUST RUN BEFORE ANYTHING ELSE
scoreboard objectives add TinkerersCraft dummy [{"text":"Tinkerer's Craft","color":"gold"}]



# load config
scoreboard players operation FUNCTION$loadconfig TinkerersCraft = BOOL$true DatapackManager

# start tickers
scoreboard players operation LOOP$tickers.1t.isLooping TinkerersCraft = BOOL$true DatapackManager
scoreboard players operation LOOP$tickers.2t.isLooping TinkerersCraft = BOOL$true DatapackManager
scoreboard players operation LOOP$tickers.5t.isLooping TinkerersCraft = BOOL$true DatapackManager
scoreboard players operation LOOP$tickers.1s.isLooping TinkerersCraft = BOOL$true DatapackManager

# force to run inline
function tinkererscraft:packages/slowupdates/update


# install
# only install if hasn't been installed before
execute unless score FLAG$secret TinkerersCraft = FLAG$secret DatapackManager run function tinkererscraft:installer-v2.06.00


# check datapack version
# compatibility: porting version number from the old v1.3/v2.0 system to new datapack manager
scoreboard players operation VERSION$datapack.latest TinkerersCraft = $tc.version TP_version
# don't need to check if the current config version is already the latest
# updates only have to run if the current version is later than the latest
execute unless score VERSION$datapack.current TinkerersCraft = VERSION$datapack.latest TinkerersCraft run function tinkererscraft:packages/versioning/check



# hooks
execute if score CONFIG$hooks.isEnabled TinkerersCraft = BOOL$true DatapackManager run function tinkererscraft:packages/hooks/enable
execute if score CONFIG$hooks.isEnabled TinkerersCraft = BOOL$false DatapackManager run function tinkererscraft:packages/hooks/disable