# overrides the ui system and skips to the irgol display


# override other tags
tag @s remove TC_outputnull
tag @s remove TC_outputiron
tag @s remove TC_outputgold
tag @s remove TC_outputobsidian
tag @s remove TC_outputobdiam

# display irgol
tag @s add TC_outputirgol

# update ui
function tinkererscraft:root/smeltery/ui/update