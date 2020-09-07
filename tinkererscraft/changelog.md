# changelog v2.0.0

gameplay related changes:

+ the datapack can detect which version of minecraft you're playing and use the version of the pack designed for that update
+ the smeltable item used to start the smeltery is now saved in the new smeltery
+ throwing in a smeltable item spawns an xp orb as a indication of success
+ smelting ores in the smeltery gives some xp (per stack, it does not consider the amount of ores in a stack)
+ empty tanks no longer show up when cycling through the display
+ jumping now resets lunge
+ the lunge skill no longer requires a jump to activate
+ the heated smelting radius to 4 (from 5)
+ smeltery now makes a hissing sound as an indication of failure


full dev log:

+ added license, copyright, and a code standard
+ redesigned the smeltee detection system
+ smeltee filter order has been tweaked
+ throwing in a command block will fill the smeltery to max capacity
+ redesigned the smeltery creation system
+ the item used to initialize the smeltery is now saved in the new smeltery
- TC_setzero tag deprecated
+ updated the storage capacity system
+ updated the smeltery removal system
+ updated the ambient effects system
+ added an xp reward for smelting ores in the smeltery (per stack, does not consider stack count)
+ stopped display from showing empty containers (defaults to iron if all containers are empty)
+ updated the item frame alignment system
+ updated the smeltery pouring system
+ updated the item casting system
- increased the amount of time taken to cast nuggets, ingots, and obdiam tools
+ fixed a bug where xp is given on smelt even when the smeltery is full
+ redesigned the loading and installing sequence
- many tags and fake player names used for loading and installing are now deprecated
+ added a version checker for filtering minecraft versions from 1.13 to 1.16 (thanks to Ryuggo)
+ added an internal versioning system the datapack
+ added an uninstall file to remove the pack without leaving persistent traces (ignores global objectives, currently doesn't remove custom items from inventories, chests, or floor)
+ added capability to target specific minecraft versions
+ updated the custom particle tag system
+ updated the custom enchants system
+ merged the justcasted particle effect with the heated particle effect
+ tweaked the persistent tag for newly casted items to be TC_casted (used to be TC_justcasted)
- removed the requirement of jumping to get the lunge skill tech
+ fixed a bug where jumping did not reset lunge
+ edited the guide book to reflect the change above
+ buffed the effects of the lunge skill
+ tweaked the smeltery breaking explosion sound effects
+ reworked the storage advancements to prepare for future updates
- rebalanced the xp rewards for advancements
+ restructured the entire datapack
+ reduced the heated smelting radius to 4 (from 5)
+ improved the flaming particle effect to show the range of the heated effect
+ fixed a bug where nether gold ore did not create a smeltery
+ improved item detection by tagging items that cannot be smelted with TC_slag
+ added sound effects for trying to smelt slag
+ fixed a bug where the ui did not update when the storage capacity limiter sets the value
+ fixed a bug where xp did not spawn
+ added a ui override system
+ improved the item detection system to automatically switch the ui display to the most recent item thrown in



# todo

Riptide
- when holding riptide, randomly tag nearby entities with TC_markedfordeath or TC_markedfordeath_
- when holding riptide & TC_markedfordeath, effect glowing if near player
- when holding riptide & TC_markedfordeath & TC_hurt, tag with TC_rip



heated items on the floor has special effects on the block it is on and in
- grass block turns into dirt, then into coarse dirt (70 > 100)
- grass, weeds, and flowers turns into dead bushes (85)
- water will sizzle

run garbage collection at tick 19

redesign the storage capacity system
- lower the limit (256)
- increase limit by throwing in netherite blocks (each block increases capacity by 256, 15 blocks to max smeltery)
- old smelteries will update automatically to have max capacity (4096)
