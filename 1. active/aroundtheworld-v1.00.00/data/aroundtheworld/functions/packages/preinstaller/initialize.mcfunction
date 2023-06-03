tellraw @a[tag=aw_debug] [{"text":"AW","color":"blue"},{"text":" > packages/preinstaller/initialize.mcfunction","color":"gray"}]

# create master scoreboard
# WARNING: THIS COMMAND MUST RUN BEFORE ANYTHING ELSE
scoreboard objectives add AroundTheWorld dummy [{"text":"Around the World","color":"blue"}]



# load config
scoreboard players operation FUNCTION$loadconfig AroundTheWorld = BOOL$true DatapackManager
# force to run inline
function aroundtheworld:packages/slowupdates/update

# check datapack version
# don't need to check if the current config version is already the latest
# updates only have to run if the current version is later than the latest
execute unless score VERSION$datapack.current AroundTheWorld = VERSION$datapack.latest AroundTheWorld run function aroundtheworld:packages/versioning/check

# install
# only install if hasn't been installed before
execute unless score FLAG$secret AroundTheWorld = FLAG$secret DatapackManager run function aroundtheworld:installer-v1.00.00



# start tickers
scoreboard players operation LOOP$tickers.1t.isLooping AroundTheWorld = BOOL$true DatapackManager
scoreboard players operation LOOP$tickers.1s.isLooping AroundTheWorld = BOOL$true DatapackManager
scoreboard players operation FLAG$dirty AroundTheWorld = BOOL$true DatapackManager



# hooks
execute if score CONFIG$hooks.isEnabled AroundTheWorld = BOOL$true DatapackManager run function aroundtheworld:packages/hooks/enable
execute if score CONFIG$hooks.isEnabled AroundTheWorld = BOOL$false DatapackManager run function aroundtheworld:packages/hooks/disable