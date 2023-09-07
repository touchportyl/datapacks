tellraw @a[tag=dd_debug] [{"text":"DD","color":"light_purple"},{"text":" > config.mcfunction","color":"gray"}]



# change BOOL$true to BOOL$false and vice versa to change the functionality of the datapack

#> toggle door explosion on destroy (default: true)
# setting this option to true makes doors more destructive by exploding when being broken
# this damages entities, breaks blocks, and sets the surroundings on fire
scoreboard players operation CONFIG$destroyexplosively DimensionalDoors = BOOL$true DatapackManager

#> toggle performance mode (default: false)
# this option lowers the amount of particles displayed
# leave this on true if the particles cause lag
scoreboard players operation CONFIG$performance DimensionalDoors = BOOL$false DatapackManager

#> toggle particles (default: false)
# this option disables all particles displayed by dimensional doors
# there is no way to visibly tell if a door is a dimensional door when this option is set to true
# leave this on true if the particles cause lag
scoreboard players operation CONFIG$disableparticles DimensionalDoors = BOOL$false DatapackManager


# enables the hooks system which allows this datapack to communicate with other datapacks
# setting it to BOOL$false will disable any possible multi-datapack functionality
scoreboard players operation CONFIG$hooks.isEnabled DimensionalDoors = BOOL$false DatapackManager










# WARNING: ONLY CHANGE THESE CONFIGURATION OPTIONS IF YOU KNOW WHAT YOU'RE DOING
# CHANGING THESE SETTINGS COULD FORCE THE DATAPACK TO RUN COMMANDS THAT IT SHOULDN'T

# set the datapack's current version
scoreboard players set VERSION$datapack.current DimensionalDoors 30105

# set the backward and forward compatible minecraft versions
scoreboard players set VERSION$minecraft.backward DimensionalDoors 14
scoreboard players set VERSION$minecraft.forward DimensionalDoors 20

# special override to run this datapack on other versions
scoreboard players operation VERSION$ignorecompatibility.backward DimensionalDoors = BOOL$false DatapackManager
scoreboard players operation VERSION$ignorecompatibility.forward DimensionalDoors = BOOL$false DatapackManager