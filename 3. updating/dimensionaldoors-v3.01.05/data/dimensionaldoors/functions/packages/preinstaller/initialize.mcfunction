tellraw @a[tag=dd_debug] [{"text":"DD","color":"light_purple"},{"text":" > packages/preinstaller/initialize.mcfunction","color":"gray"}]

# create master scoreboard
# WARNING: THIS COMMAND MUST RUN BEFORE ANYTHING ELSE
scoreboard objectives add DimensionalDoors dummy [{"text":"Dimensional Doors","color":"light_purple"}]



# load config
scoreboard players operation FUNCTION$loadconfig DimensionalDoors = BOOL$true DatapackManager

# start tickers
scoreboard players operation LOOP$tickers.1t.isLooping DimensionalDoors = BOOL$true DatapackManager
scoreboard players operation LOOP$tickers.1s.isLooping DimensionalDoors = BOOL$true DatapackManager

# force to run inline
function dimensionaldoors:packages/slowupdates/update


# install
# only install if hasn't been installed before
execute unless score FLAG$secret DimensionalDoors = FLAG$secret DatapackManager run function dimensionaldoors:installer-v3.01.00


# check datapack version
# don't need to check if the current config version is already the latest
# updates only have to run if the current version is later than the latest
execute unless score VERSION$datapack.current DimensionalDoors = VERSION$datapack.latest DimensionalDoors run function dimensionaldoors:packages/versioning/check



# hooks
execute if score CONFIG$hooks.isEnabled DimensionalDoors = BOOL$true DatapackManager run function dimensionaldoors:packages/hooks/enable
execute if score CONFIG$hooks.isEnabled DimensionalDoors = BOOL$false DatapackManager run function dimensionaldoors:packages/hooks/disable