# change BOOL$true to BOOL$false and vice versa to change the functionality of the datapack


#> Enable destructive explosions (default: true)
# Setting this option to true makes doors more destructive by exploding when being broken.
# This damages entities, breaks blocks, and sets the surroundings on fire.
scoreboard players operation CONFIG$destroyexplosively DimensionalDoors = BOOL$true DatapackManager

#> Enable performance mode (default: false)
# This option lowers the amount of particles displayed.
# Set this to true if the particles cause lag.
scoreboard players operation CONFIG$performance DimensionalDoors = BOOL$false DatapackManager

#> Disable particles (default: false)
# This option disables all particles displayed by dimensional doors.
# There is no way to visibly tell if a door is a dimensional door when this option is set to true.
# Set this to true if the particles still cause lag in performance mode.
scoreboard players operation CONFIG$disableparticles DimensionalDoors = BOOL$false DatapackManager