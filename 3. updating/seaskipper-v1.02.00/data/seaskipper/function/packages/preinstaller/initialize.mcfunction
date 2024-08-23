# create master scoreboard
# WARNING: THIS COMMAND MUST RUN BEFORE ANYTHING ELSE
scoreboard objectives add Seaskipper dummy {"text":"Seaskipper","color":"aqua"}

# notify
tellraw @a [{"text":"","color":"gray"},{"text":" + ","color":"green"},{"text":"Seaskipper","color":"white"},{"text":" >","color":"white"},{"text":" Initialized."}]

# load config
function seaskipper:config

# install
# only install if hasn't been installed before
execute unless score FLAG$secret Seaskipper = FLAG$secret DatapackManager run function seaskipper:root/core/installer-v1.02.00
scoreboard players operation FLAG$secret Seaskipper = FLAG$secret DatapackManager

# check datapack version
# don't need to check if the current config version is already the latest
# updates only have to run if the current version is later than the latest
execute unless score VERSION$datapack.current Seaskipper = VERSION$datapack.latest Seaskipper run function seaskipper:packages/versioning/check


# start datapack
schedule clear seaskipper:root/npc/behaviors/generic/ambientparticles
schedule clear seaskipper:root/1t
schedule clear seaskipper:packages/endermitescript/1t

schedule function seaskipper:root/npc/behaviors/generic/ambientparticles 1s
schedule function seaskipper:root/1t 1s
schedule function seaskipper:packages/endermitescript/1t 1s


# hooks
execute if score CONFIG$hooks.isEnabled Seaskipper = BOOL$true DatapackManager run function seaskipper:packages/hooks/enable
execute if score CONFIG$hooks.isEnabled Seaskipper = BOOL$false DatapackManager run function seaskipper:packages/hooks/disable