# turns items into scoreboard values


# obdiam
scoreboard players remove @s TC_lIrgol 3
scoreboard players remove @s TC_lObsidian 8
scoreboard players add @s TC_lObdiam 1

#fx:reaction
function tinkererscraft:effects/smelting/reacting

# advancement on reaction
execute as @s at @s run advancement grant @a[distance=..7,sort=nearest] until tinkererscraft:smelting/reacting/obdiam

# remove tag
tag @s remove TC_obdiamreaction

# display shows recently smelted
function tinkererscraft:root/smeltery/ui/override/obdiam