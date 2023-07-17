# Endermite Script v1.0
# You're running the standalone version of EM Script

# EM Script is a custom datapack for running functions when a specifically named Endermite is spawned into the world with an anvil-renamed spawn egg.

# Attach all your custom functions here!


# blinking redstone lamp

# create
tag @s[name="redstone lamp create"] add ems_parsed
execute as @s[name="redstone lamp create",tag=ems_parsed] at @s run function endermitescriptstandalone:endermitescript/blinkingredstonelamp/create

# destroy
tag @s[name="redstone lamp destroy"] add ems_parsed
execute as @s[name="redstone lamp destroy",tag=ems_parsed] at @s run function endermitescriptstandalone:endermitescript/blinkingredstonelamp/destroy

# reveal
tag @s[name="redstone lamp reveal"] add ems_parsed
execute as @s[name="redstone lamp reveal",tag=ems_parsed] at @s run function endermitescriptstandalone:endermitescript/blinkingredstonelamp/reveal



# remove endermite
tp @e[tag=ems_parsed] ~ -70 ~
kill @e[tag=ems_parsed]