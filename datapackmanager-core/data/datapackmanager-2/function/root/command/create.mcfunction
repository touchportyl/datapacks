# One trigger objective carries every command; the verb is the integer the player passes with
# `/trigger dm_command set <n>`. /trigger is permission level 0, so ordinary players (not just
# operators) can use it. The objective name is <= 16 characters because Minecraft capped
# objective names at 16 before 1.18, and this framework supports back to 1.14.
scoreboard objectives add dm_command trigger [{"text":"DatapackManager"}]
scoreboard players enable @a dm_command
