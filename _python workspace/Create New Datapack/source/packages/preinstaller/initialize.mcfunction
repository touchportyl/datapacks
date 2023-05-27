tellraw @a[tag=$datapackID_lower_debug] [{"text":"$datapackID","color":"$datapackColor"},{"text":" > packages/preinstaller/initialize.mcfunction","color":"gray"}]

# create master scoreboard
# WARNING: THIS COMMAND MUST RUN BEFORE ANYTHING ELSE
scoreboard objectives add $datapackFullName dummy [{"text":"$datapackDisplayName","color":"$datapackColor"}]



# load config
scoreboard players operation FUNCTION$loadconfig $datapackFullName = BOOL$true DatapackManager
# force to run inline
function $datapackFullName_lower:packages/slowupdates/update

# check datapack version
# don't need to check if the current config version is already the latest
# updates only have to run if the current version is later than the latest
execute unless score VERSION$datapack.current $datapackFullName = VERSION$datapack.latest $datapackFullName run function $datapackFullName_lower:packages/versioning/check

# install
# only install if hasn't been installed before
execute unless score FLAG$secret $datapackFullName = FLAG$secret DatapackManager run function $datapackFullName_lower:installer-$datapackDisplayVersion



# start tickers
scoreboard players operation LOOP$tickers.1t.isLooping $datapackFullName = BOOL$true DatapackManager
scoreboard players operation LOOP$tickers.1s.isLooping $datapackFullName = BOOL$true DatapackManager
scoreboard players operation FLAG$dirty $datapackFullName = BOOL$true DatapackManager



# hooks
execute if score CONFIG$hooks.isEnabled $datapackFullName = BOOL$true DatapackManager run function $datapackFullName_lower:packages/hooks/enable
execute if score CONFIG$hooks.isEnabled $datapackFullName = BOOL$false DatapackManager run function $datapackFullName_lower:packages/hooks/disable