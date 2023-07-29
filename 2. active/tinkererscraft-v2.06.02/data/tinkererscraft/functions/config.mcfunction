tellraw @a[tag=tc_debug] [{"text":"TC","color":"gold"},{"text":" > config.mcfunction","color":"gray"}]



# change BOOL$true to BOOL$false and vice versa to change the functionality of the datapack

# enables the hooks system which allows this datapack to communicate with other datapacks
# setting it to BOOL$false will disable any possible multi-datapack functionality
scoreboard players operation CONFIG$hooks.isEnabled TinkerersCraft = BOOL$false DatapackManager


# for developers: add your own datapack configuration settings here and remember to remove this message after

# code use example:
# execute if CONFIG$addyourown TinkerersCraft = BOOL$true DatapackManager run say "This code runs because addyourown is enabled in the config."
#scoreboard players operation CONFIG$addyourown TinkerersCraft = BOOL$false DatapackManager


# WARNING: ONLY CHANGE THESE CONFIGURATION OPTIONS IF YOU KNOW WHAT YOU'RE DOING
# CHANGING THESE SETTINGS COULD FORCE THE DATAPACK TO RUN COMMANDS THAT IT SHOULDN'T

# set the datapack's current version
scoreboard players set VERSION$datapack.current TinkerersCraft 20602

# set the backward and forward compatible minecraft versions
scoreboard players set VERSION$minecraft.backward TinkerersCraft 16
scoreboard players set VERSION$minecraft.forward TinkerersCraft 20

# special override to run this datapack on other versions
scoreboard players operation VERSION$ignorecompatibility.backward TinkerersCraft = BOOL$false DatapackManager
scoreboard players operation VERSION$ignorecompatibility.forward TinkerersCraft = BOOL$false DatapackManager