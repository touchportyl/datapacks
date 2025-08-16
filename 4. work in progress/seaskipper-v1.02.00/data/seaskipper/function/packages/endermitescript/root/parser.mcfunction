# Endermite Script v1.02.00
# You're running the integrated version of EM Script
# Remember to start the parser by running "<namespace>:endermitescript/tick" in your load/install function

# The Endermite Script Datapack is a custom command wrapper which allows commands to be run by placing anvil-renamed Endermite spawn eggs.

# Attach all your custom functions here!


execute as @s[name="/seaskipper create"] at @s run function seaskipper:packages/endermitescript/commands/seaskipper/create
execute as @s[name="/seaskipper destroy"] at @s run function seaskipper:packages/endermitescript/commands/seaskipper/destroy

execute as @s[name="/looktarget create"] at @s positioned ~ ~-1 ~ run function seaskipper:packages/endermitescript/commands/looktarget/create
execute as @s[name="/looktarget destroy"] at @s positioned ~ ~-1 ~ run function seaskipper:packages/endermitescript/commands/looktarget/destroy
execute as @s[name="/looktarget reveal"] at @s positioned ~ ~-1 ~ run function seaskipper:packages/endermitescript/commands/looktarget/reveal



# cleanup
function seaskipper:packages/endermitescript/root/cleanup