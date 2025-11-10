# summon the conduit item with the appropriate data based on the Minecraft version

# pre 1.20.3
execute if score VERSION$minecraft.current DatapackManager matches ..12002 run function dimensionaldoors:compatibility/root/create/datatagging/summon/createlinkedconduit-1.20.3

# 1.20.3 to 1.20.6
execute if score VERSION$minecraft.current DatapackManager matches 12003..12006 run function dimensionaldoors:compatibility/root/create/datatagging/summon/createlinkedconduit-1.20.6

# 1.21+
execute if score VERSION$minecraft.current DatapackManager matches 12100.. run function dimensionaldoors:compatibility/root/create/datatagging/summon/createlinkedconduit-1.21


# remove tag once used
execute as @e[tag=DD_generateLink] run tag @s remove DD_generateLink