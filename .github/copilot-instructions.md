# Datapack Development Instructions

## Project Overview
This is a **Minecraft datapack development workspace** by touchportyl, containing multiple datapack projects at various stages of completion. The project uses a structured development pipeline with Python automation tools and follows the "Datapack Framework" for standardized development.

## Project Structure & Development Pipeline

### 6-Stage Development Pipeline
The workspace is organized into **6 numbered folders** representing development stages:
1. `1. released/` - Production .zip files distributed publicly
2. `2. ready for release/` - Complete datapacks ready for packaging
3. `3. requires update/` - Working datapacks needing version updates
4. `4. work in progress/` - Active development datapacks
5. `5. concepts/` - Experimental/unfinished datapack ideas
6. `6. archived/` - Historical code for reference

### Special Directories
- `_pythontools/` - Python automation utilities (primary: `datapack_manager_tool.py`)
- `_packages/` - Reusable datapack modules (e.g., `endermitescript/`)
- `_standards/` - Template/framework files (`datapackmanager-mc1.21/`)

## Key Development Tools

### Datapack Manager Tool (`_pythontools/datapack_manager_tool.py`)
**Primary automation tool** - Tkinter GUI application with 4 main tabs:
- **Datapacks tab**: Browse/manage datapack files across the development pipeline
- **Tag Parser tab**: Analyze and debug datapack tags (CONFIG$, scoreboard names, etc.)
- **Logs tab**: Centralized output for all operations
- **Settings tab**: Configure tool paths and preferences

**Key usage**: Use this tool for debugging tags, managing files, and validating datapack structure.

### Python Tool Architecture
- Uses `ConfigParser` for settings management (`dmtool_settings.ini`)
- Implements threaded operations for non-blocking GUI
- Dynamic nested notebook structure for organizing datapack analysis
- Centralized logging system with color-coded output

## Minecraft Datapack Conventions

### Reserved Datapack Tags
**Critical**: Each datapack has a 2-letter prefix for namespacing:
- `[DM]` Datapack Manager (framework)
- `[HV]` Harvester, `[DD]` Dimensional Doors, `[TC]` Tinkerer's Craft
- `[AW]` Around The World, `[PT]` Portyl Trident, `[SS]` Seaskipper
- `[ES]` Endermite Script, `[VE]` Vanilla Essentials, etc.

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

## Critical Notes
- **Pack format 15** targets Minecraft 1.14-1.21 compatibility
- All datapacks integrate with the **Datapack Manager framework**
- Use **absolute paths** in Python tools to avoid navigation issues
- The Tag Parser expects specific scoreboard naming conventions for proper analysis
- Function files use `/function` paths (not `/functions`) in some namespaces
- **PowerShell Syntax**: When chaining commands in Windows PowerShell v5.1, use semicolon (`;`) instead of `&&`. Example: `cd "path"; python script.py` NOT `cd "path" && python script.py`

When working on this codebase, prioritize understanding the 6-stage development pipeline and leverage the Datapack Manager Tool for debugging and file management.