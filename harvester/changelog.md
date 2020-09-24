# changelog v2.0

gameplay related changes:

+ the datapack can detect which version of minecraft you're playing and use the version of the pack designed for that update
+ fixed bugs with the api
+ harvester doesn't lag as much anymore (yay)
+ all hoes now have the harvesting feature, not just diamond ones
+ harvester now has in-built progression where the hoes harvest more land and crops as the materials improve
+ xp is given on replant


full dev log:

+ added license, copyright, and a code standard
+ redesigned the loading and installing sequence
+ many tags used for loading and installing are now deprecated
+ added a version checker for filtering minecraft versions from 1.13 to 1.16 (thanks to Ryuggo)
+ added an internal versioning system for the datapack
+ added an uninstall file to remove the pack without leaving persistent traces (ignores global objectives, currently doesn't remove custom items from inventories, chests, or floor)
+ added capability to target specific minecraft versions
+ optimised the long block of code into separate files
+ updated the hoe and seed detection system
+ added more bass to the harvesting sound
+ removed the xp ding from the harvesting sound
+ added an xp reward for using the instant replant feature
+ harvesting now requires looking downwards (why would you be looking at the sky while harvesting, wtf is wrong with you)
+ tags are now all semi-persistent
+ all hoes now have the harvesting function
+ added more harvesting patterns for different hoe materials (1x1, 3x3_star, 3x3)
+ added netherite hoe functionality
+ netherite hoe can now harvest and replant nether wart
+ seed collection is now calculated individually for each block, harvesting 3 blocks will only remove 3 seeds (used to be: collect 2-5 seeds per harvest)
+ seeds have a 1 in 4 chance to not be used for planting (calculates for all plots of land per harvest)
+ increased the amount of xp given if seeds were not used for replanting (basically 1/4 chance to get double the xp)
+ added an advancement [You Can Do That?!]
+ tweaked the advancement [A Better Harvester] for the updated Tinkerer's Craft advancement tree (used to be [A Better Hoe?!])
+ added basic api overrides for Tinkerer's Craft custom hoes
+ updated the item hot swapping system to loop itself every 10 ticks (thanks Pundus)
+ fixed a bug with the advancement [A Better Harvester] where it gave the advancement for non-hoe casted items
+ fixed a bug where some tags were not cleaned up properly due to load order
+ added garbage collection for api tags







# todo

add api features
- irgol grants an extra drop per plot harvested and poisonous potatoes are replaced with normal potatoes
- obdiam instantly cooks normal and poisonous potatoes







-
