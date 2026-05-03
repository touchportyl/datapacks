# Swift Ghasts v1.00.01 for Vanilla MC 1.21.6 - 26.1.2
- Code by [touchportyl](https://github.com/touchportyl/)

# Overview
Swift Ghasts is a lightweight quality-of-life datapack that increases the flying speed of Happy Ghasts, making aerial travel faster and more responsive. It is designed to feel natural within vanilla gameplay while removing the sluggishness of default Happy Ghast movement.

The datapack makes no changes to AI behavior, combat, or spawning logic - it simply boosts flight speed in a clean, multiplayer-safe way.

# Features
- Increases Happy Ghast flying speed
- Attribute-based implementation (no NBT hacks)
- Fully vanilla and multiplayer-safe
- Automatically applies to all Happy Ghasts
- Compatible with other datapacks and server-side mods
- Minimal performance impact
- Clean uninstall script that removes everything the datapack modified

# How to use
- Ride on any Happy Ghast.
- Use movement keys and feel the ghast accelerate past its usual speed!

# Config
- Maximum Speed (default speed for ghasts are 500) -> `/scoreboard players set VAR$speed.max SwiftGhasts 1000`
- Maximum Speed (when a leash is attached) -> `/scoreboard players set VAR$speed.max.leashed SwiftGhasts 700`
- Forward Acceleration -> `/scoreboard players set VAR$speed.control.forward SwiftGhasts 10`
- Backward Acceleration -> `/scoreboard players set VAR$speed.control.backward SwiftGhasts 2`
- Sideways Acceleration -> `/scoreboard players set VAR$speed.control.strafe SwiftGhasts 7`
- Upward Acceleration -> `/scoreboard players set VAR$speed.control.up SwiftGhasts 5`
- Deceleration -> `/scoreboard players set VAR$speed.control.deceleration SwiftGhasts 20`

# Future Updates
- Suggestions welcome!
