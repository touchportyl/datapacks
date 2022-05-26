tellraw @a[tag=debug] [{"text":"[ config.mcfunction ]","color":"gray"}]

# set the forward, current, and backward compatibility limits for the datapack
scoreboard players set $config.versioning.minecraft.backward DatapackManager 112
scoreboard players set $config.versioning.minecraft.current DatapackManager 117
scoreboard players set $config.versioning.minecraft.forward DatapackManager 117

scoreboard players set $config.versioning.manager.backward DatapackManager 10000
scoreboard players set $config.versioning.manager.current DatapackManager 10000
scoreboard players set $config.versioning.manager.forward DatapackManager 10100

scoreboard players set $config.versioning.datapack.backward DatapackManager 10000
scoreboard players set $config.versioning.datapack.current DatapackManager 10000
scoreboard players set $config.versioning.datapack.forward DatapackManager 10100

# resolve error by disabling pack
execute if score $debug.error.forcedisablepack DatapackManager = $bool.true DatapackManager run datapack disable "file/datapackmanager"