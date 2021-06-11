#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> limiter (references: ../main)
# this code enforces the storage limit


# individual limiter checks
execute if score @s TC_lCopper > @s TC_lCapacity run function tinkererscraft:modules/smeltery/capacity/copper
execute if score @s TC_lIron > @s TC_lCapacity run function tinkererscraft:modules/smeltery/capacity/iron
execute if score @s TC_lGold > @s TC_lCapacity run function tinkererscraft:modules/smeltery/capacity/gold
execute if score @s TC_lObsidian > @s TC_lCapacity run function tinkererscraft:modules/smeltery/capacity/obsidian
execute if score @s TC_lIrgol > @s TC_lCapacity run function tinkererscraft:modules/smeltery/capacity/irgol
execute if score @s TC_lObdiam > @s TC_lCapacity run function tinkererscraft:modules/smeltery/capacity/obdiam


# advancement for max copper
execute as @s[scores={TC_lCopper=4096}] at @s run advancement grant @e[type=player,distance=..7,sort=nearest] only tinkererscraft:smeltery/capacity/copper

# advancement for max iron
execute as @s[scores={TC_lIron=4096}] at @s run advancement grant @e[type=player,distance=..7,sort=nearest] only tinkererscraft:smeltery/capacity/iron

# advancement for max gold
execute as @s[scores={TC_lGold=4096}] at @s run advancement grant @e[type=player,distance=..7,sort=nearest] only tinkererscraft:smeltery/capacity/gold

# advancement for max obsidian
execute as @s[scores={TC_lObsidian=4096}] at @s run advancement grant @e[type=player,distance=..7,sort=nearest] only tinkererscraft:smeltery/capacity/obsidian

# advancement for max irgol
execute as @s[scores={TC_lIrgol=4096}] at @s run advancement grant @e[type=player,distance=..7,sort=nearest] only tinkererscraft:smeltery/capacity/irgol

# advancement for max obdiam
execute as @s[scores={TC_lObdiam=4096}] at @s run advancement grant @e[type=player,distance=..7,sort=nearest] only tinkererscraft:smeltery/capacity/obdiam


# advancement on max capacity
execute as @s[scores={TC_lCopper=4096,TC_lIron=4096,TC_lGold=4096,TC_lObsidian=4096,TC_lIrgol=4096,TC_lObdiam=4096}] at @s run advancement grant @e[type=player,distance=..7,sort=nearest] only tinkererscraft:smeltery/capacity/max


#> End of file
#> -----------
