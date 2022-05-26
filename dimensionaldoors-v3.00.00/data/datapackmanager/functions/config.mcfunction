tellraw @a[tag=debug] [{"text":"> config.mcfunction","color":"gray"}]

# Customize your configuration for Datapack Manager

# Note that this file is meant for developers to use to feed data into the Datapack Manager for it to function as it should
# Don't touch this file if you don't know what you're doing, you might cause the datapack to run commands that it shouldn't and cause irreversible damage to your world


# set the datapack's current version
scoreboard players set VERSION$datapack.current DatapackManager 30000

# set the backward and forward compatible minecraft versions
scoreboard players set VERSION$minecraft.backward DatapackManager 13
scoreboard players set VERSION$minecraft.forward DatapackManager 19
