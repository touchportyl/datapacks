# touchportal's Datapacks
All of the developmental versions for datapacks created by [touchportal](https:/github.com/touchportal) can be found here. The builds here are usually unfinished and are not game ready.

This code is protected by the GNU GPLv3 License | © 2020 Portyl Studios https://portylstudios.com

---

## The release version of the datapacks can be found here:
+ [Tinkerer's Craft](https:/github.com/touchportal/tinkererscraft)
+ [Dimensional Doors](https:/github.com/touchportal/dimensionaldoors)
+ [Harvester](https:/github.com/touchportal/harvester)
+ Vanilla Essentials (Unreleased)
+ Speedrun Tools (Deprecated, go use the one Sethbling made)

---

## Versioning System
Just because I can, I developed a versioning system with apis and multi-datapack features. It will be released as a template package soon, and all my datapacks will be ported to this new system. [The flowchart on how it works can be found here.](http://go.bubbl.us/a9e420/ba77?/Datapack-Installation-Flowchart)

### Features:
- Standardised naming and structural system no matter what kind of pack you're developing
- Detect and deploy a custom version of your datapack targeted for that version of Minecraft
- Automatically cancel datapack installation on versions that are not supported
- Detect and install your datapack unless a newer version exists
- Run cleanup code to remove deprecated items, tags, and entities for old versions of your datapack
- Enable extra features if two datapacks are installed together (uninstalling one pack will simply disable the extra features)
- Cleanly uninstall and disable your pack with a simple function (namespace:uninstall)
