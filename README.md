# touchportal's Datapacks
All of the developmental versions for datapacks created by [touchportal](https:/github.com/touchportal) can be found here. The builds here are unfinished and not ready to be used.

This code is protected by the GNU GPLv3 License
© 2020 Portyl Studios
https://portylstudios.com

---

## The release version of the datapacks can be found here:
+ [Tinkerer's Craft](https:/github.com/touchportal/tinkererscraft)
+ [Dimensional Doors](https:/github.com/touchportal/dimensionaldoors)
+ [Harvester](https:/github.com/touchportal/harvester)

---

## Versioning System
Just because I can, I developed a versioning system with apis and multi-datapack features. It will be released as a template package soon, and all my datapacks will be ported to this new system. [The flowchart on how it works can be found here.](https://bubbl.us/11133984)

<iframe width="90%" height="600" allowfullscreen frameborder="0" src="https://bubbl.us/NTg1MzA3NC8xMTEzMzk4NC9lNmRlMWE4NTcxNWVmOGQ5ZTRiYWViOGE4OGEwNDQzYg==-X?s=11133984&utm_source=page-embed&utm_medium=link"></iframe>

### Features:
- Standardised naming and structural system no matter what kind of pack you're developing
- Detect and deploy a custom version of your datapack targeted for that version of Minecraft
- Automatically cancel datapack installation on versions that are not supported
- Detect and install your datapack unless a newer version exists
- Run cleanup code to remove deprecated items, tags, and entities for old versions of your datapack
- Enable extra features if two datapacks are installed together (uninstalling one pack will simply disable the extra features)
- Cleanly uninstall and disable your pack with a simple function (<namespace>:uninstall)
