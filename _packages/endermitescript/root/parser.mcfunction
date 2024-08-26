# Endermite Script v1.02.00
# You're running the integrated version of EM Script
# Remember to start the parser by running "<namespace>:endermitescript/tick" in your load/install function

# The Endermite Script Datapack is a custom command wrapper which allows commands to be run by placing anvil-renamed Endermite spawn eggs.

# Attach all your custom functions here!


# The following is an example of how to create a custom function for the Endermite Script parser
execute as @s[name="/greet"] at @s run function mydatapack:packages/endermitescript/commands/greet


# cleanup
function mydatapack:packages/endermitescript/commands/cleanup