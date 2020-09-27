# old changelogs
- Smeltery structure (Added in v0.1-alpha)

- Smeltable items (Iron, Gold, Obsidian) (Added in v0.5-beta)
- Toggleable display (Added in v0.8-beta)

- Full multiplayer support (Added in v1.0)

- Support for smelting some ores (Added in v1.1)
- Sounds and particles (Added in v1.1)

- Support for smelting some blocks (Added in v1.2)
- Cauldron System to produce blocks (Added in v1.2)
- Smelting ores now give 2 ingots (Added in v1.2)

- Anvil System to produce tools, nuggets, and ingots (Added in v1.3)
- Tools produced are enchanted (Added in v1.3)

- Changed the name to Tinkerer's Craft (Added in v1.4)
- Support for custom alloys (Added in v1.4)
- Irgol (Added in v1.4)
- Obdiam (Added in v1.4)

- Create an API system to hook other plugins to Tinkerer's Craft properly (Added in v1.5)
- Custom enchant: Harvester (for Irgol and Obdiam hoes) - [Harvester Datapack](https://github.com/touchportal/harvester) (Added in v1.5)

- Custom enchant: Lunge (for Irgol swords) - Sneak to get a burst of speed (Added in v1.6)

- Lunge has been moved over to Iron Sword (Added in v1.7)
- Custom enchant: Riptide (for Irgol swords) - The sword has a chance to kill a mob for you (Added in v1.7)
- Custom quirk: Iron tools are Lightweight - Tools have the efficiency enchant (Added in v1.7)
- Custom quirk: Obdiam tools are Heated - Auto smelt items on the floor near the player holding it (Added in v1.7)
- Lots of bug fixes (Added in v1.7)

- Added a guide book (Added in v1.8)
- Guide book shows the smeltery structure when crouched (Added in v1.8)
- Created advancements for doing things (Added in v1.8)
- Fixed a bug where auto smelted stuff can smelt other stuff (Added in v1.8)

- Smelting support for nether gold ore (Added in v1.9)
- Riptide now gives double the loot from the mob it kills (Added in v1.9)

- Updated for 1.16.2 (Added in v1.9.1)


# changelog v2.0.0

most important change:
ITS NOT LAGGY ANYMORE (used to be 26ms+ per tick, now it's 5ms per tick)

smeltery:
+ smelting ores in the smeltery gives some xp (per stack, it does not consider the amount of ores in a stack)
+ the smeltable item used to start the smeltery is now saved in the new smeltery
+ empty tanks no longer show up when cycling through the display
+ smelteries now has a tougher progression system to fit true endgame better, upgrade using a netherite block
+ the guidebook visualizer will no longer show up if you are too close to a smeltery

metals:
+ obdiam can only be produced in an upgraded furnace
+ increased the requirements to react obdiam to 3 irgol + 8 obsidian (from 2 iron + 4 obsidian)

quirks and enchants:
+ minor changes to all quirks
+ the lunge skill no longer requires a jump to activate
+ jumping now resets lunge
+ riptide enchant has been reworked (hitting entities marked for death will activate riptide, instead of random activation)
+ heated tools now cause environmental damage

cool dev stuff:
+ the datapack can detect which version of minecraft you're playing and use the version of the pack designed for that update



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
+ added an internal versioning system for the datapack
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
+ added more flair to the riptide particle timeline
+ reworked the riptide enchant
+ added new randomizer (TC_rand_6)
+ marked entities now glow if they are within 12 blocks of a player holding riptide
+ updated the guidebook visualization system
+ improved the lava visualizer particle
+ updated the garbage collection system
+ lowered the volume of the lever clang
+ added guidebook particles if it is dropped on the floor
+ fixed a bug where the heated enchant would smelt casted items
+ added sfx when smelting a command block
+ heated tools on the floor now cause environmental damage
+ heated tools now have a particle effect when in water
+ added progression to the storage capacity system
+ default smeltery capacity is now 256
+ smelting netherite blocks increases capacity by 256 each (15 blocks to max smeltery)
+ old smelteries will update automatically to have max capacity (4096)
+ reworked advancements again to match the new storage capacity system
+ fixed a bug where the player can still react metals when the storage is full
+ added sfx when smelting a netherite block
+ tweaked all custom items to properly show their quirks in the description
+ decreased efficiency of casted iron tools to 2 (from 4)
+ fixed a bug where the cast iron sword did not have sharpness 1
+ updated the guidebook to reflect all the previous changes
+ reduced the pickup delay of obdiam tools
+ added fortune 2 or looting 2 to irgol tools
+ increased the requirements to react obdiam to 3 irgol + 8 obsidian (from 2 iron + 4 obsidian)
+ producing obdiam now requires an upgraded smeltery
+ fixed a bug with the guidebook where clicking on the return to topic button (➥ Building a Smeltery) brings you to the contents page instead
+ shifted the obdiam advancement after the upgrade advancement (from the build smeltery advancement)
+ updated the guidebook to reflect all the previous changes
+ updated for Minecraft 1.16.3
+ fixed a major bug where the wrong entity was being removed thus resulting in the smeltery committing self delete
+ removed the requirement for levers from the multiblock structure check



# todo












-
