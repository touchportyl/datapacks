# create master scoreboard
# WARNING: THIS COMMAND MUST RUN BEFORE ANYTHING ELSE
scoreboard objectives add DimensionalDoors dummy [{"text":"Dimensional Doors","color":"light_purple"}]

# notify
tellraw @a [{"text":"","color":"gray"},{"text":" + ","color":"green"},{"text":"Dimensional Doors","color":"white"},{"text":" >","color":"white"},{"text":" Initialized."}]

# load config
function dimensionaldoors:config

# install
# only install if hasn't been installed before
execute unless score FLAG$secret DimensionalDoors = FLAG$secret DatapackManager run function dimensionaldoors:root/core/installer-v3.02.00
scoreboard players operation FLAG$secret DimensionalDoors = FLAG$secret DatapackManager

# check datapack version
# don't need to check if the current config version is already the latest
# updates only have to run if the current version is later than the latest
execute unless score VERSION$datapack.current DimensionalDoors = VERSION$datapack.latest DimensionalDoors run function dimensionaldoors:packages/versioning/check


# start datapack
schedule clear dimensionaldoors:root/1t
schedule clear dimensionaldoors:root/1s

schedule function dimensionaldoors:root/1t 1s
schedule function dimensionaldoors:root/1s 1s


# hooks
execute if score CONFIG$hooks.isEnabled DimensionalDoors = BOOL$true DatapackManager run function dimensionaldoors:packages/hooks/enable
execute if score CONFIG$hooks.isEnabled DimensionalDoors = BOOL$false DatapackManager run function dimensionaldoors:packages/hooks/disable