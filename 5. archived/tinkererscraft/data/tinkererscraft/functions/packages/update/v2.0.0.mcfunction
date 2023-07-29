#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> v2.0.0
# this code updates v1.9 to v2.0


# update version
scoreboard players set $tc.version TP_version 20000

# display update msg if cleanup happens
# TC_api_hash for v1.9 and v1.9.1 is set as 101
execute if score TC_api_hash TC_api matches 101 run tellraw @a [{"text":""},{"text":" -","color":"red"},{"text":" Cleaning up","color":"gray"},{"text":" [Tinkerer's Craft] ","color":"aqua"},{"text":"v1.9.1"}]


# update
# ------

# assign capacity values to old smelteries
execute as @e[tag=TC_smeltery,scores={TC_lIron=..512,TC_lGold=..512,TC_lObsidian=..512,TC_lIrgol=..512,TC_lObdiam=..512}] unless score @s TC_lCapacity matches 256..4096 run scoreboard players set @s TC_lCapacity 512
execute as @e[tag=TC_smeltery,scores={TC_lIron=..768,TC_lGold=..768,TC_lObsidian=..768,TC_lIrgol=..768,TC_lObdiam=..768}] unless score @s TC_lCapacity matches 256..4096 run scoreboard players set @s TC_lCapacity 768
execute as @e[tag=TC_smeltery,scores={TC_lIron=..1024,TC_lGold=..1024,TC_lObsidian=..1024,TC_lIrgol=..1024,TC_lObdiam=..1024}] unless score @s TC_lCapacity matches 256..4096 run scoreboard players set @s TC_lCapacity 1024
execute as @e[tag=TC_smeltery,scores={TC_lIron=..1280,TC_lGold=..1280,TC_lObsidian=..1280,TC_lIrgol=..1280,TC_lObdiam=..1280}] unless score @s TC_lCapacity matches 256..4096 run scoreboard players set @s TC_lCapacity 1280
execute as @e[tag=TC_smeltery,scores={TC_lIron=..1536,TC_lGold=..1536,TC_lObsidian=..1536,TC_lIrgol=..1536,TC_lObdiam=..1536}] unless score @s TC_lCapacity matches 256..4096 run scoreboard players set @s TC_lCapacity 1536
execute as @e[tag=TC_smeltery,scores={TC_lIron=..1792,TC_lGold=..1792,TC_lObsidian=..1792,TC_lIrgol=..1792,TC_lObdiam=..1792}] unless score @s TC_lCapacity matches 256..4096 run scoreboard players set @s TC_lCapacity 1792
execute as @e[tag=TC_smeltery,scores={TC_lIron=..2048,TC_lGold=..2048,TC_lObsidian=..2048,TC_lIrgol=..2048,TC_lObdiam=..2048}] unless score @s TC_lCapacity matches 256..4096 run scoreboard players set @s TC_lCapacity 2048
execute as @e[tag=TC_smeltery,scores={TC_lIron=..2304,TC_lGold=..2304,TC_lObsidian=..2304,TC_lIrgol=..2304,TC_lObdiam=..2304}] unless score @s TC_lCapacity matches 256..4096 run scoreboard players set @s TC_lCapacity 2304
execute as @e[tag=TC_smeltery,scores={TC_lIron=..2560,TC_lGold=..2560,TC_lObsidian=..2560,TC_lIrgol=..2560,TC_lObdiam=..2560}] unless score @s TC_lCapacity matches 256..4096 run scoreboard players set @s TC_lCapacity 2560
execute as @e[tag=TC_smeltery,scores={TC_lIron=..2816,TC_lGold=..2816,TC_lObsidian=..2816,TC_lIrgol=..2816,TC_lObdiam=..2816}] unless score @s TC_lCapacity matches 256..4096 run scoreboard players set @s TC_lCapacity 2816
execute as @e[tag=TC_smeltery,scores={TC_lIron=..3072,TC_lGold=..3072,TC_lObsidian=..3072,TC_lIrgol=..3072,TC_lObdiam=..3072}] unless score @s TC_lCapacity matches 256..4096 run scoreboard players set @s TC_lCapacity 3072
execute as @e[tag=TC_smeltery,scores={TC_lIron=..3328,TC_lGold=..3328,TC_lObsidian=..3328,TC_lIrgol=..3328,TC_lObdiam=..3328}] unless score @s TC_lCapacity matches 256..4096 run scoreboard players set @s TC_lCapacity 3328
execute as @e[tag=TC_smeltery,scores={TC_lIron=..3584,TC_lGold=..3584,TC_lObsidian=..3584,TC_lIrgol=..3584,TC_lObdiam=..3584}] unless score @s TC_lCapacity matches 256..4096 run scoreboard players set @s TC_lCapacity 3584
execute as @e[tag=TC_smeltery,scores={TC_lIron=..3840,TC_lGold=..3840,TC_lObsidian=..3840,TC_lIrgol=..3840,TC_lObdiam=..3840}] unless score @s TC_lCapacity matches 256..4096 run scoreboard players set @s TC_lCapacity 3840
execute as @e[tag=TC_smeltery,scores={TC_lIron=..4096,TC_lGold=..4096,TC_lObsidian=..4096,TC_lIrgol=..4096,TC_lObdiam=..4096}] unless score @s TC_lCapacity matches 256..4096 run scoreboard players set @s TC_lCapacity 4096


# cleanup
# -------

# remove objectives
scoreboard objectives remove TC_init
scoreboard objectives remove TC_api
scoreboard objectives remove TP_Timer

# remove tags
tag @e[tag=TC_setzero] remove TC_setzero


# install current version
function tinkererscraft:packages/install


#> End of file
#> -----------
