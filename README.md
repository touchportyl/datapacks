# touchportyl's Datapacks
All of the developmental versions for datapacks created by [touchportyl](https:/github.com/touchportyl) can be found here. The builds here are usually unfinished and are not game ready.

## Branches
There are 2 main branches, each at different levels of completion.
- main: Holds the latest release versions of everything.
- staging: Holds the newest seemingly working version. Bugs should be minimal, contains unfinished features and breaking changes.
New dev branches can be created from staging which holds everything from bugs to unfinished features.

## Project Structure and MCFunction++
This repository uses MCFunction++, which is my custom IDE designed for developing Minecraft datapacks. The M++ workspace file is provided in the repo.

> Learn more about MCFunction++ [here](https://github.com/Portyl-Studios/MCFunctionPlusPlus).

There are 6 standardized tags to filter datapacks into their various levels of progress.
- Released: Contains all the working datapacks that have been released publicly.
- Ready for release: Working datapacks that are fully updated to the latest version, but have not been released publicly yet.
- Requires update: Already working datapacks that requires an update to the latest version of Minecraft.
- Work in progress: Datapacks that don't work and are currently being worked on.
- Concepts: Unfinished conceptual datapacks in early stage testing.
- Archived: Old code for reference whenever needed.

The project contains 5 folders all prefixed with an underscore so that they will show up at the top. This structure is still being worked on as Datapack Manager is being developed.
- _archived: Datapacks that are no longer being used or developed.
- _dist: All published .zip files, these are the same files found on sites like planetminecraft or curseforge.
- _packages: Shared packages that can be imported into existing datapack projects.
- _pythontools: Various python tooling used for development.
- _standards: Standardizations used in various datapacks.

> Note that the repo structure was changed to better fit MCFunction++'s intended use case.

Use the Datapack Manager Tool to speed up certain common actions and help with debugging.

> The Datapack Manager Tool is currently being sunsetted and replaced by MCFunction++.

This code is protected by the GNU GPLv3 License | © 2026 Portyl Studios https://portylstudios.com/

---

## The release versions of the datapacks can be found here:
+ [Tinkerer's Craft](https://github.com/touchportyl/tinkererscraft)
+ [Dimensional Doors](https://github.com/touchportyl/dimensionaldoors)
+ [Harvester](https://github.com/touchportyl/harvester)

---

## Reserved Datapack Tags (676 unique possibilities)
- [DM] Datapack Manager
- [MD] My Datapack (Reserved for templates)
- [HV] Harvester
- [DD] Dimensional Doors
- [TC] Tinkerer's Craft
- [AW] Around The World
- [PT] Portyl Trident
- [SS] Seaskipper
- [ES] Endermite Script
- [RE] Race to the End
- [SG] Swift Ghasts

- [VE] Vanilla Essentials
- [VC] Villager Chat

---

## Datapack Manager
[The Datapack Framework](https://portylstudios.notion.site/The-Datapack-Framework-d913361385c8484ba97a97f07c75bb39?pvs=4) has been updated. Supports Minecraft 1.14 to 1.21.