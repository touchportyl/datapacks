# changelog v3.02.02

important changes:
+ even lesser lag
+ slightly improved hoes harvesting range
+ diamond hoes can harvest nether wart now
+ diamond hoes now harvest in a 5x5 star pattern
+ netherite hoes now harvest in a 5x5 pattern
+ no longer works with Tinkerer's Craft (wait for a TC update first!)


full dev log:
+ ported over to the latest version of datapack manager
+ buffed most of the hoes
+ slowed the detection from 1t to 2t
+ fixed plenty of porting bugs
+ fixed an oversight where netherite was not in 1.14 which made harvesting nether wart impossible since it was locked only to netherite hoes
+ updated compatibility support for 1.14 (no predicates)
+ updated for 1.20
+ temporarily disabled api/hooks



# changelog v2.00.00

gameplay related changes:

+ the datapack can detect which version of minecraft you're playing and use the version of the pack designed for that update
+ fixed bugs with the api
+ harvester doesn't lag as much anymore (yay)
+ all hoes now have the harvesting feature, not just diamond ones
+ harvester now has in-built progression where the hoes harvest more land and crops as the materials improve
+ xp is given on replant
+ api now fully works when installed with Tinkerer's Craft


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
+ fixed the load order for api which was causing a lot of bugs
+ added more api features for irgol and obdiam tools
+ harvesting with irgol hoes now grants an extra drop per plot harvested and poisonous potatoes are replaced with normal potatoes
+ harvesting with obdiam hoes now instantly cooks normal and poisonous potatoes
+ swapped the hardcoded item data swapper out for a for loop



# old changelogs
- Remove the offhand requirement for harvesting (Added in the v1.3 update)

- Added an API hook to work smoothly with Tinkerer's Craft (Added in the v1.2 update)
- Tested in the newest snapshot [20w21a] (Added in the v1.2 update)

- 3x3 Harvesting (Added in the v1.1 update)