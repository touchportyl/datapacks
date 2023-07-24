# dev command to fill the storage of a smeltery to capacity


# set values to max
scoreboard players set @s TC_lIron 4097
scoreboard players set @s TC_lGold 4097
scoreboard players set @s TC_lObsidian 4097
scoreboard players set @s TC_lIrgol 4097
scoreboard players set @s TC_lObdiam 4097

#sfx:activate
function tinkererscraft:effects/generic/activate


# cleanup
kill @e[tag=TC_commandblock,distance=..2]