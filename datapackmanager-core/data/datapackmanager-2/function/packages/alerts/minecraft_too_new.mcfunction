# Fired when the ratchet lands on the sentinel leaf: a Minecraft newer than this datapack
# supports. The pack keeps running - it will usually work - but the player is told, once.
tellraw @s [{"text":"[DatapackManager] ","color":"gray"},{"text":"This Minecraft version is newer than this datapack supports. It may misbehave - check for an update.","color":"red"}]
