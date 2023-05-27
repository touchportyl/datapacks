# Endermite Script v1.01.00
# You're running the integrated version of EM Script
# Remember to start the parser by running "<namespace>:endermitescript/tick" in your load/install function

# The Endermite Script Datapack is a custom command wrapper which allows commands to be run by placing anvil-renamed Endermite spawn eggs.

# Attach all your custom functions here!


# npc

# seaskipper

# create
tag @s[name="seaskipper create"] add ES_parsed
execute as @s[name="seaskipper create",tag=ES_parsed] at @s run function seaskipper:endermitescript/seaskipper/create

# destroy
tag @s[name="seaskipper destroy"] add ES_parsed
execute as @s[name="seaskipper destroy",tag=ES_parsed] at @s run function seaskipper:endermitescript/seaskipper/destroy


# looktarget

# create
tag @s[name="looktarget create"] add ES_parsed
execute as @s[name="looktarget create",tag=ES_parsed] at @s positioned ~ ~-1 ~ run function seaskipper:endermitescript/looktarget/create

# destroy
tag @s[name="looktarget destroy"] add ES_parsed
execute as @s[name="looktarget destroy",tag=ES_parsed] at @s positioned ~ ~-1 ~ run function seaskipper:endermitescript/looktarget/destroy

# reveal
tag @s[name="looktarget reveal"] add ES_parsed
execute as @s[name="looktarget reveal",tag=ES_parsed] at @s positioned ~ ~-1 ~ run function seaskipper:endermitescript/looktarget/reveal


# remove endermite
tp @e[tag=ES_parsed] ~ -70 ~
kill @e[tag=ES_parsed]

# ignore endermite
tag @e[tag=ES_tagged] add ES_ignore