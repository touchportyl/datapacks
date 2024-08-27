# enforces the storage limit for obsidian


#sfx
function tinkererscraft:effects/smeltery/capacity/limit

# set to storage capacity
scoreboard players operation @s TC_lObsidian = @s TC_lCapacity

# update ui
function tinkererscraft:root/smeltery/ui/update