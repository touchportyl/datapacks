# change BOOL$true to BOOL$false and vice versa to change the functionality of the datapack


# enables the hooks system which allows this datapack to communicate with other datapacks
# setting it to BOOL$false will disable any possible multi-datapack functionality
scoreboard players operation CONFIG$hooks.isEnabled MyDatapack = BOOL$false DatapackManager










# WARNING: ONLY CHANGE THESE CONFIGURATION OPTIONS IF YOU KNOW WHAT YOU'RE DOING
# CHANGING THESE SETTINGS COULD FORCE THE DATAPACK TO RUN COMMANDS THAT IT SHOULDN'T

# set the datapack's current version
scoreboard players set VERSION$datapack.current MyDatapack 10003

# set the backward and forward compatible minecraft versions
scoreboard players set VERSION$minecraft.backward MyDatapack 21
scoreboard players set VERSION$minecraft.forward MyDatapack 21

# special override to run this datapack on other versions
scoreboard players operation VERSION$ignorecompatibility.backward MyDatapack = BOOL$false DatapackManager
scoreboard players operation VERSION$ignorecompatibility.forward MyDatapack = BOOL$true DatapackManager