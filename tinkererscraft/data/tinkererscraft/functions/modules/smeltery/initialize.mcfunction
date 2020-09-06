#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> initialize (references: ../modules/smeltery/build)
# this code initializes the smeltery, creates the display, advancements
# tags:
# - TinkerersCraft (default persisting tag for all entities created by Tinkerer's Craft)
# - TC_display (persisting tag for both UI elements)
# - TC_number (persisting descriptive tag)
# - TC_ore (persisting descriptive tag)


# removes null values for the new objectives the smeltery has
scoreboard players set @s TC_lIron 0
scoreboard players set @s TC_lGold 0
scoreboard players set @s TC_lObsidian 0
scoreboard players set @s TC_lIrgol 0
scoreboard players set @s TC_lObdiam 0

# create smeltery display
execute as @s at @s positioned ^ ^0.8 ^1 run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["TinkerersCraft","TC_display","TC_number"],CustomName:"{\"text\":\"Break\"}",CustomNameVisible:1b,Age:-2147483648,Duration:-1,WaitTime:-2147483648,Particle:"minecraft:mycelium"}
execute as @s at @s positioned ^ ^0.6 ^1 run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["TinkerersCraft","TC_display","TC_ore"],CustomName:"{\"text\":\"Glass\"}",CustomNameVisible:1b,Age:-2147483648,Duration:-1,WaitTime:-2147483648,Particle:"minecraft:mycelium"}

#sfx:clang
playsound minecraft:block.anvil.use block @a ~ ~ ~ 1 1.2 0

# grant advancements to players near the new smeltery
advancement grant @e[type=player,distance=..15,sort=nearest] until tinkererscraft:smeltery/smeltery_built


#> End of file
#> -----------
