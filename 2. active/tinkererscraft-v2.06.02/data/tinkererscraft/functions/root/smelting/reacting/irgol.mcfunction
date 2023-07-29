# turns items into scoreboard values


# irgol
scoreboard players remove @s TC_lIron 2
scoreboard players remove @s TC_lGold 3
scoreboard players add @s TC_lIrgol 1

#fx:reaction
function tinkererscraft:effects/smelting/reacting

# advancement on reaction
execute as @s at @s run advancement grant @a[distance=..7,sort=nearest] until tinkererscraft:smelting/reacting/irgol

# remove tag
tag @s remove TC_irgolreaction

# display shows recently smelted
function tinkererscraft:root/smeltery/ui/override/irgol