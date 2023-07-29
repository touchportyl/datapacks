# initializes the smeltery, creates the display, and grants advancements

# tags:
# - TinkerersCraft (default persisting tag for all entities created by Tinkerer's Craft)
# - TC_display (persisting tag for both UI elements)
# - TC_number (persisting descriptive tag)
# - TC_ore (persisting descriptive tag)


# sets default values for the new objectives the smeltery has
scoreboard players set @s TC_lIron 0
scoreboard players set @s TC_lGold 0
scoreboard players set @s TC_lObsidian 0
scoreboard players set @s TC_lIrgol 0
scoreboard players set @s TC_lObdiam 0

# set default smeltery capacity
scoreboard players set @s TC_lCapacity 256


# create smeltery display
execute as @s at @s positioned ^ ^0.8 ^1 run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["TinkerersCraft","TC_display","TC_number"],CustomName:'{"text":"Break"}',CustomNameVisible:1b,Age:-2147483648,Duration:-1,WaitTime:-2147483648,Particle:"minecraft:mycelium"}
execute as @s at @s positioned ^ ^0.6 ^1 run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["TinkerersCraft","TC_display","TC_ore"],CustomName:'{"text":"Glass"}',CustomNameVisible:1b,Age:-2147483648,Duration:-1,WaitTime:-2147483648,Particle:"minecraft:mycelium"}

# create lava
setblock ^ ^ ^ minecraft:lava replace


#sfx:startup
function tinkererscraft:effects/smeltery/startup


# grant advancements to players near the new smeltery
advancement grant @a[distance=..7,sort=nearest] until tinkererscraft:smeltery/smeltery_built