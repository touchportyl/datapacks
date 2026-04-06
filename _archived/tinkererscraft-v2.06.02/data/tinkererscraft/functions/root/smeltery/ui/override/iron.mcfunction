# overrides the ui system and skips to the iron display


# override other tags
tag @s remove TC_outputnull
tag @s remove TC_outputgold
tag @s remove TC_outputobsidian
tag @s remove TC_outputirgol
tag @s remove TC_outputobdiam

# display iron
tag @s add TC_outputiron

# update ui
function tinkererscraft:root/smeltery/ui/update