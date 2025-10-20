# Datapack Development Instructions

## Project Overview
This is a **Minecraft datapack development workspace** by touchportyl, containing multiple datapack projects at various stages of completion. The project uses a structured development pipeline with Python automation tools and follows the "Datapack Framework" for standardized development.

**Current Version**: Built for Minecraft 1.21.9

## Project Structure & Development Pipeline

### 6-Stage Development Pipeline
The workspace is organized into **6 numbered folders** representing development stages:
1. `1. released/` - Production .zip files distributed publicly
2. `2. ready for release/` - Complete datapacks ready for packaging (aroundtheworld, endreplacement, harvester, portyltrident)
3. `3. requires update/` - Working datapacks needing version updates
4. `4. work in progress/` - Active development datapacks (dimensionaldoors, seaskipper, tinkererscraft)
5. `5. concepts/` - Experimental/unfinished datapack ideas (endermitescriptstandalone, vanillaessentials, villagerchat)
6. `6. archived/` - Historical code for reference

### Special Directories
- `_pythontools/` - Python automation utilities (primary: `datapack_manager_tool.py`)
- `_packages/` - Reusable datapack modules (e.g., `endermitescript/`)
- `_standards/` - Template/framework files (`datapackmanager-mc1.21/`)
- Root level working directory (e.g., `dimensionaldoors-v3.02.01/`) - Current development workspace

## Key Development Tools

### Datapack Manager Tool (`_pythontools/datapack_manager_tool.py`)
**Primary automation tool** - Comprehensive Tkinter GUI application (mc1.21.9) with 6 main tabs:

1. **Datapack Explorer** - Browse and manage datapacks across the development pipeline
   - Scan datapack root directories to detect all datapacks
   - Display datapack information with titles, descriptions, versions, and status tags
   - Filter archived datapacks with checkbox toggle
   - Open datapacks in VS Code or file explorer
   - Manage release output paths
   - Stage-aware detection (released, ready for release, requires update, work in progress, concepts, archived)

2. **Tag Analyzer** - Analyze and parse datapack tags, configurations, and function calls
   - Parse config tags (z_xx_###_t/f format), player tags (XX_ prefix), and special tags (XX$format)
   - Display tags organized by datapack → namespace → tag type hierarchy
   - Show file locations, line numbers, and context for each tag occurrence
   - Tag Statistics tab showing all unique tags found with occurrence counts
   - Dynamic column resizing and horizontal scrolling
   - Threaded parsing for responsive UI

3. **Project Creator** - Bootstrap new datapack projects from templates
   - Clone starter pack structure
   - Replace template strings in file/folder names and contents
   - Configure new datapack name, tag, version, and description
   - Automatic namespace conversion (mydatapack → new namespace)
   - Preserves file structure and datapack framework integration

4. **Framework Updater** - Update framework files while preserving user content
   - Compare template and target datapacks
   - Identify framework folders requiring updates (data/datapackmanager-1.21, data/datapackmanager, data/minecraft)
   - Show file diffs with added/removed/modified line counts
   - Preview changes before applying
   - Automatic namespace conversion for 'mydatapack:' references
   - Skip specific patterns (e.g., mydatapack:packages/preinstaller/load)
   - Hash-based file comparison for efficiency

5. **Logs** - Centralized logging output with color-coded messages
   - Info (black), success (green), warning (orange), error (red)
   - Timestamps for all operations
   - Auto-scroll to latest log entry

6. **Settings** - Configure tool paths and preferences
   - Set datapack root directory
   - Configure release output path
   - Paths automatically saved and loaded

### Python Tool Architecture
- Uses `ConfigParser` for settings management (`dmtool_settings.ini`)
- Implements threaded operations for non-blocking GUI (Thread, Lock)
- Dynamic nested notebook structure (3 levels: datapack → namespace → tag type)
- Centralized LogFrame class for consistent logging across all features
- Auto-scan functionality on startup
- Modern 'clam' theme with custom styling

## Minecraft Datapack Conventions

### Reserved Datapack Tags
**Critical**: Each datapack has a 2-3 letter prefix for namespacing:
- `[DM]` Datapack Manager (framework)
- `[MD]` My Datapack (reserved for templates)
- `[HV]` Harvester, `[DD]` Dimensional Doors, `[TC]` Tinkerer's Craft
- `[AW]` Around The World, `[PT]` Portyl Trident, `[SS]` Seaskipper
- `[ES]` Endermite Script, `[VE]` Vanilla Essentials, `[VC]` Villager Chat, `[ST]` Speedrun Timer

### File Structure Pattern
All datapacks follow this standardized structure:
```
datapack-name/
├── pack.mcmeta (pack_format: 15 for mc1.21)
├── README.md
├── changelog.md (for released versions)
└── data/
    ├── datapackmanager/ (framework integration)
    ├── datapackmanager-1.21/ (version-specific framework)
    ├── minecraft/ (vanilla overrides)
    └── [namespace]/ (main datapack code)
        ├── advancement/
        ├── function/
        ├── predicate/
        └── item_modifier/
```

### Function File Conventions
- **Header comments**: Include project name, GPL license, and Portyl Studios copyright
- **Section markers**: Use `#>` for major sections, `#` for regular comments
- **End markers**: Files end with `#> End of file` and separator line
- **Load/tick pattern**: `load.mcfunction` handles initialization, `tick.mcfunction` calls main logic
- **Version checking**: Use scoreboard objectives like `TP_version` for compatibility

### Configuration Pattern
- Use scoreboard format: `CONFIG$<setting_name> <Namespace>` 
- Boolean values: Reference `BOOL$true`/`BOOL$false` from `DatapackManager`
- Example: `scoreboard players operation CONFIG$harvestxp Harvester = BOOL$true DatapackManager`

## Development Workflows

### Creating New Datapacks
1. Use `_standards/datapackmanager-mc1.21/` as base template
2. Update `pack.mcmeta` with correct description and pack_format
3. Implement in `mydatapack` namespace, then rename to project namespace
4. Follow the 6-stage pipeline: concepts → work in progress → requires update → ready for release → released

### Debugging Workflow
1. Open Datapack Manager Tool
2. Use Tag Parser to scan for CONFIG$ tags, scoreboards, and function calls
3. Check logs tab for errors and warnings
4. Navigate between nested notebook tabs for detailed tag analysis

### Release Process
1. Move from `4. work in progress/` to `2. ready for release/`
2. Use `folder_zipper.bat` for packaging
3. Deploy to `1. released/` and separate GitHub repositories

## Branch Strategy
- **master**: Latest stable release versions
- **staging**: Working versions with minimal bugs, may contain unfinished features
- **dev branches**: Created from staging for feature development

## Recent Development Work

### Dimensional Doors v3.02.01
- Added new particle tag (DD_particle_C) to existing oak doors for visual effects
- Created new config triggers (z_dd_001_t format) for datapack manager integration
- Updated door rotation placement mechanics
- **Performance improvement**: Replaced Area Effect Clouds (AECs) with marker armor stands
- Implemented v1 and v2 door closer mechanisms with complete door type support
- Added pale_oak door support across all systems
- Created version-organized grouping files for cleaner door management

### Current Active Projects
- **dimensionaldoors-v3.02.00**: Portal system with complete door support (oak, spruce, birch, jungle, acacia, dark_oak, crimson, warped, mangrove, cherry, bamboo, pale_oak)
- **seaskipper-v1.02.00**: Navigation/transportation system
- **tinkererscraft-v2.06.02**: Crafting enhancement system

## Critical Notes
- **Pack format 15** targets Minecraft 1.14-1.21 compatibility
- All datapacks integrate with the **Datapack Manager framework**
- Use **absolute paths** in Python tools to avoid navigation issues
- The Tag Analyzer expects specific scoreboard naming conventions for proper analysis
- Function files use `/function` paths (not `/functions`) in some namespaces
- **PowerShell Syntax**: When chaining commands in Windows PowerShell v5.1, use semicolon (`;`) instead of `&&`. Example: `cd "path"; python script.py` NOT `cd "path" && python script.py`

## External Resources
- [The Datapack Framework](https://portylstudios.notion.site/The-Datapack-Framework-d913361385c8484ba97a97f07c75bb39) - Notion documentation
- [Tinkerer's Craft](https://github.com/touchportyl/tinkererscraft) - Release repository
- [Dimensional Doors](https://github.com/touchportyl/dimensionaldoors) - Release repository
- [Harvester](https://github.com/touchportyl/harvester) - Release repository

When working on this codebase, prioritize understanding the 6-stage development pipeline and leverage the Datapack Manager Tool for debugging and file management.