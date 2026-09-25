# Reward function of the hidden advancement datapackmanager-2:enable_command (criterion
# minecraft:tick, no display), which every player earns on their first second online: it arms
# the CLI for that player. Deliberately never revoked - revoking would let the tick trigger
# re-grant it every second, turning a once-per-player hook into a per-second loop.
scoreboard players enable @s dm_command
