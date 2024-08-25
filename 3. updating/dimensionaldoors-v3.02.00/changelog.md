# for tracking any breaking updates

# v3.00.00 -> v3.01.00
- change color (light_purple) of "DimensionalDoors"
- move DD$secret DimensionalDoors to FLAG$secret DimensionalDoors
- change color (light_purple) and name (Door ID) of "DD_doorID"

# v3.01.00 -> v3.02.00
- all old doors will be updated to follow the updated tag standard
  - tag DD_oak with DD_particle_B

# done
- added proper support for 1.20.3-1.20.5
- add new particles for the other door types
- write updater script
- optimize detection to only run when the door is open
- change auto closer so that powered doors stay open

# todo
- add tag so that different doors cannot be linked
- add config to disable checking of same style doors