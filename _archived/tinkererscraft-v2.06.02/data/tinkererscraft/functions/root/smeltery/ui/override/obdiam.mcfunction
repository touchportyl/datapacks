# overrides the ui system and skips to the obdiam display


# override other tags
tag @s remove TC_outputnull
tag @s remove TC_outputiron
tag @s remove TC_outputgold
tag @s remove TC_outputobsidian
tag @s remove TC_outputirgol

# display obdiam
tag @s add TC_outputobdiam

# update ui
function tinkererscraft:root/smeltery/ui/update