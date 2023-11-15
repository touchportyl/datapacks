tellraw @a[tag=hv_debug] [{"text":"HV","color":"gold"},{"text":" > config.mcfunction","color":"gray"}]



# change BOOL$true to BOOL$false and vice versa to change the functionality of the datapack

# enables xp (and bonus xp) gain on harvest
# setting it to BOOL$false will disable the xp drop
scoreboard players operation CONFIG$wheat.xp Harvester = BOOL$true DatapackManager
scoreboard players operation CONFIG$wheat.xp.bonus Harvester = BOOL$true DatapackManager

scoreboard players operation CONFIG$carrot.xp Harvester = BOOL$true DatapackManager
scoreboard players operation CONFIG$carrot.xp.bonus Harvester = BOOL$true DatapackManager

scoreboard players operation CONFIG$potato.xp Harvester = BOOL$true DatapackManager
scoreboard players operation CONFIG$potato.xp.bonus Harvester = BOOL$true DatapackManager

scoreboard players operation CONFIG$beetroot.xp Harvester = BOOL$true DatapackManager
scoreboard players operation CONFIG$beetroot.xp.bonus Harvester = BOOL$true DatapackManager

scoreboard players operation CONFIG$netherwart.xp Harvester = BOOL$true DatapackManager
scoreboard players operation CONFIG$netherwart.xp.bonus Harvester = BOOL$true DatapackManager

# enables tool damage when harvesting
# setting it to BOOL$false will disable tool damage when harvesting
scoreboard players operation CONFIG$tooldamage Harvester = BOOL$false DatapackManager


# enables the hooks system which allows this datapack to communicate with other datapacks
# setting it to BOOL$false will disable any possible multi-datapack functionality
scoreboard players operation CONFIG$hooks.isEnabled Harvester = BOOL$false DatapackManager



# WARNING: ONLY CHANGE THESE CONFIGURATION OPTIONS IF YOU KNOW WHAT YOU'RE DOING
# CHANGING THESE SETTINGS COULD FORCE THE DATAPACK TO RUN COMMANDS THAT IT SHOULDN'T

# set the datapack's current version
scoreboard players set VERSION$datapack.current Harvester 30204

# set the backward and forward compatible minecraft versions
scoreboard players set VERSION$minecraft.backward Harvester 14
scoreboard players set VERSION$minecraft.forward Harvester 20

# special override to run this datapack on other versions
scoreboard players operation VERSION$ignorecompatibility.backward Harvester = BOOL$false DatapackManager
scoreboard players operation VERSION$ignorecompatibility.forward Harvester = BOOL$true DatapackManager