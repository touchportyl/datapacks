# Runs each second in the active generation's loop. Only touches players who have actually used
# the trigger, so an idle server does no per-player work.
execute as @a[scores={dm_command=-2147483648..}] at @s run function datapackmanager-2:root/command/dispatch
