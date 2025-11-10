# Endermite Script v1.03.00
# You're running the integrated version of ES
# Remember to start the parser by running "<namespace>:endermitescript/tick" in your load/install function

# The Endermite Script Datapack is a custom command wrapper which allows commands to be run by placing anvil-renamed Endermite spawn eggs.

# Attach all your custom functions here!


execute as @s[name="/marker create"] at @s positioned ~ ~-1 ~ run function mydatapack:packages/endermitescript/commands/marker/create
execute as @s[name="/marker destroy"] at @s positioned ~ ~-1 ~ run function mydatapack:packages/endermitescript/commands/marker/destroy
execute as @s[name="/marker reveal"] at @s positioned ~ ~-1 ~ run function mydatapack:packages/endermitescript/commands/marker/reveal



# cleanup
function mydatapack:packages/endermitescript/root/cleanup