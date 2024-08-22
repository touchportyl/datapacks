# create master scoreboard
# WARNING: THIS COMMAND MUST RUN BEFORE ANYTHING ELSE
scoreboard objectives add PortylTrident dummy

# notify
tellraw @a [{"text":"","color":"gray"},{"text":" + ","color":"green"},{"text":"Portyl Trident","color":"white"},{"text":" >","color":"white"},{"text":" Datapack loaded."}]


# install
# only install if hasn't been installed before
execute unless score FLAG$secret PortylTrident = FLAG$secret DatapackManager run function portyltrident:root/core/installer-v1.00.00
scoreboard players operation FLAG$secret PortylTrident = FLAG$secret DatapackManager

# check datapack version
# don't need to check if the current config version is already the latest
# updates only have to run if the current version is later than the latest
execute unless score VERSION$datapack.current PortylTrident = VERSION$datapack.latest PortylTrident run function portyltrident:packages/versioning/check


# hooks
execute if score CONFIG$hooks.isEnabled PortylTrident = BOOL$true DatapackManager run function portyltrident:packages/hooks/enable
execute if score CONFIG$hooks.isEnabled PortylTrident = BOOL$false DatapackManager run function portyltrident:packages/hooks/disable