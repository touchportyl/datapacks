# summon the conduit item with the appropriate data based on the Minecraft version

# 1.20.4 and older: item data lives in the tag field
execute if score VERSION$minecraft.current DatapackManager matches ..12004 run function dimensionaldoors:compatibility/root/create/datatagging/summon/createlinkedconduit-1.20.3

# 1.20.5 to 1.21.4: item components, with names and lore as JSON strings
execute if score VERSION$minecraft.current DatapackManager matches 12005..12104 run function dimensionaldoors:compatibility/root/create/datatagging/summon/createlinkedconduit-1.20.6

# 1.21.5 and newer: item components, with names and lore as text components
execute if score VERSION$minecraft.current DatapackManager matches 12105.. run function dimensionaldoors:compatibility/root/create/datatagging/summon/createlinkedconduit-1.21

# remove tag once used
execute as @e[tag=DD_generateLink] run tag @s remove DD_generateLink
