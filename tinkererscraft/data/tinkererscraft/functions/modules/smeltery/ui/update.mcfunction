#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> update (references: ../modules/smeltery/ui/controller && ../modules/smelting/smelt)
# this code updates the ore displays


#swap ore displays
execute as @s[tag=TC_outputiron] at @s positioned ^ ^0.6 ^1 run data modify entity @e[tag=TC_display,tag=TC_ore,distance=..1,limit=1] CustomName set value '{"text":"Iron","color":"gray"}'
execute as @s[tag=TC_outputgold] at @s positioned ^ ^0.6 ^1 run data modify entity @e[tag=TC_display,tag=TC_ore,distance=..1,limit=1] CustomName set value '{"text":"Gold","color":"yellow"}'
execute as @s[tag=TC_outputobsidian] at @s positioned ^ ^0.6 ^1 run data modify entity @e[tag=TC_display,tag=TC_ore,distance=..1,limit=1] CustomName set value '{"text":"Obsidian","color":"dark_gray"}'
execute as @s[tag=TC_outputirgol] at @s positioned ^ ^0.6 ^1 run data modify entity @e[tag=TC_display,tag=TC_ore,distance=..1,limit=1] CustomName set value '{"text":"Irgol","color":"gold"}'
execute as @s[tag=TC_outputobdiam] at @s positioned ^ ^0.6 ^1 run data modify entity @e[tag=TC_display,tag=TC_ore,distance=..1,limit=1] CustomName set value '{"text":"Obdiam","color":"dark_red"}'


#place sign (text parser)
setblock ^ ^1 ^2 minecraft:oak_sign replace

#parse scoreboard on sign Text1
execute as @s[tag=TC_outputiron] at @s run data modify block ^ ^1 ^2 Text1 set value '{"score":{"name":"@e[tag=TC_smeltery,tag=TC_outputiron,distance=..4,limit=1]","objective":"TC_lIron"}}'
execute as @s[tag=TC_outputgold] at @s run data modify block ^ ^1 ^2 Text1 set value '{"score":{"name":"@e[tag=TC_smeltery,tag=TC_outputgold,distance=..4,limit=1]","objective":"TC_lGold"}}'
execute as @s[tag=TC_outputobsidian] at @s run data modify block ^ ^1 ^2 Text1 set value '{"score":{"name":"@e[tag=TC_smeltery,tag=TC_outputobsidian,distance=..4,limit=1]","objective":"TC_lObsidian"}}'
execute as @s[tag=TC_outputirgol] at @s run data modify block ^ ^1 ^2 Text1 set value '{"score":{"name":"@e[tag=TC_smeltery,tag=TC_outputirgol,distance=..4,limit=1]","objective":"TC_lIrgol"}}'
execute as @s[tag=TC_outputobdiam] at @s run data modify block ^ ^1 ^2 Text1 set value '{"score":{"name":"@e[tag=TC_smeltery,tag=TC_outputobdiam,distance=..4,limit=1]","objective":"TC_lObdiam"}}'

#transfer parsed text into custom name
execute as @s[tag=!TC_outputnull] at @s run data modify entity @e[tag=TC_display,tag=TC_number,distance=..2,limit=1] CustomName set from block ^ ^1 ^2 Text1

#remove sign
setblock ^ ^1 ^2 minecraft:air replace


#> End of file
#> -----------
