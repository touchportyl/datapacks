# changelog v2.0

gameplay related changes:

+ the datapack can detect which version of minecraft you're playing and use the version of the pack designed for that update
+ fixed bugs with the api


full dev log:

+ added license, copyright, and a code standard
+ redesigned the loading and installing sequence
+ many tags used for loading and installing are now deprecated
+ added a version checker for filtering minecraft versions from 1.13 to 1.16 (thanks to Ryuggo)
+ added an internal versioning system the datapack
+ added an uninstall file to remove the pack without leaving persistent traces (ignores global objectives, currently doesn't remove custom items from inventories, chests, or floor)
+ added capability to target specific minecraft versions
