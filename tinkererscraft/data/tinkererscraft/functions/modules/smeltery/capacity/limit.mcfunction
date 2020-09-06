#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> limit (references: ../main)
# this code enforces the storage limit


# sound cue that storage is at capacity
execute as @s[scores={TC_lIron=4097..}] run playsound minecraft:entity.generic.extinguish_fire block @a ~ ~ ~ 1 1 0
execute as @s[scores={TC_lGold=4097..}] run playsound minecraft:entity.generic.extinguish_fire block @a ~ ~ ~ 1 1 0
execute as @s[scores={TC_lObsidian=4097..}] run playsound minecraft:entity.generic.extinguish_fire block @a ~ ~ ~ 1 1 0
execute as @s[scores={TC_lIrgol=4097..}] run playsound minecraft:entity.generic.extinguish_fire block @a ~ ~ ~ 1 1 0
execute as @s[scores={TC_lObdiam=4097..}] run playsound minecraft:entity.generic.extinguish_fire block @a ~ ~ ~ 1 1 0

# visual cue that storage is at capacity
execute as @s[scores={TC_lIron=4097..}] run particle minecraft:barrier ~ ~2.5 ~ 0 0 0 0 1 force
execute as @s[scores={TC_lGold=4097..}] run particle minecraft:barrier ~ ~2.5 ~ 0 0 0 0 1 force
execute as @s[scores={TC_lObsidian=4097..}] run particle minecraft:barrier ~ ~2.5 ~ 0 0 0 0 1 force
execute as @s[scores={TC_lIrgol=4097..}] run particle minecraft:barrier ~ ~2.5 ~ 0 0 0 0 1 force
execute as @s[scores={TC_lObdiam=4097..}] run particle minecraft:barrier ~ ~2.5 ~ 0 0 0 0 1 force

# advancement on full capacity
execute as @s[scores={TC_lIron=4096,TC_lGold=4096,TC_lObsidian=4096,TC_lIrgol=4096,TC_lObdiam=4096}] as @e[type=player,distance=..7,sort=nearest] run advancement grant @s only tinkererscraft:smeltery/capacity/max

# set to storage capacity
execute as @s[scores={TC_lIron=4097..}] run scoreboard players set @s TC_lIron 4096
execute as @s[scores={TC_lGold=4097..}] run scoreboard players set @s TC_lGold 4096
execute as @s[scores={TC_lObsidian=4097..}] run scoreboard players set @s TC_lObsidian 4096
execute as @s[scores={TC_lIrgol=4097..}] run scoreboard players set @s TC_lGold 4096
execute as @s[scores={TC_lObdiam=4097..}] run scoreboard players set @s TC_lObsidian 4096


#> End of file
#> -----------
