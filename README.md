# touchportyl's Datapacks
All of the developmental versions for datapacks created by [touchportyl](https:/github.com/touchportyl) can be found here. The builds here are usually unfinished and are not game ready.

There are 3 branches, each at different levels of completion.
- master: Holds the latest release versions of everything.
- staging: Holds the newest seemingly working version. Bugs should be minimal, contains unfinished features and breaking changes.
- dev: Holds everything from bugs to unfinished features.

There are 5 folders sorting all my datapacks in various levels of progress.

This code is protected by the GNU GPLv3 License | © 2023 Portyl Studios https://portylstudios.com/

---

## The release versions of the datapacks can be found here:
+ [Tinkerer's Craft](https://github.com/touchportyl/tinkererscraft)
+ [Dimensional Doors](https://github.com/touchportyl/dimensionaldoors)
+ [Harvester](https://github.com/touchportyl/harvester)

---

## Datapack Management System
Just because I can, I developed an unnecessarily complex versioning framework to allow for forward and backward compatibility within the same datapack. All my datapacks will be ported to this new system.

[Take a look at how it can be implemented.](https://portylstudios.notion.site/The-Datapack-Versioning-Framework-9384558d49a24d12b1bafa208b3a2ae7)

### Features:
- Supports Minecraft versions 1.14 to 1.19
- Standardized naming and structural system that links up cleanly no matter what kind of pack you're developing
- Detect and deploy a custom fork of your datapack targeted for that version of Minecraft
- Add inline forks to add support for previous versions of Minecraft
- Automatically cancel datapack installation on versions that are not supported to prevent unintended commands from running
- Detect and install your datapack unless a newer version exists
- Prevent repeated installs when reloading or launching your world
- Run code to convert old tags for the new version
- Run cleanup code to remove deprecated items, tags, and entities for old versions of your datapack
- [WIP] Hooks System: Enable extra features if two datapacks are installed together (uninstalling one pack will simply disable the extra features)
- [WIP] Python generator: Run a python script to generate a fresh datapack with the datapack management system already pre-integrated