# Reward function of the enable_command advancement: arms the CLI for a player on their first
# tick online. Deliberately not revoked - revoking would let the tick trigger re-grant it every
# tick, turning a once-per-player hook into a per-tick loop.
scoreboard players enable @s dm_command
