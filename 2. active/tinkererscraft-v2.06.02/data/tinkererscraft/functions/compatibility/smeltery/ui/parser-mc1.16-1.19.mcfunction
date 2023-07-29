# parse scoreboard on sign Text1
execute as @s[tag=TC_outputiron] at @s run data modify block ^ ^1 ^2 Text1 set value '{"score":{"name":"@e[tag=TC_smeltery,tag=TC_outputiron,distance=..4,limit=1]","objective":"TC_lIron"}}'
execute as @s[tag=TC_outputgold] at @s run data modify block ^ ^1 ^2 Text1 set value '{"score":{"name":"@e[tag=TC_smeltery,tag=TC_outputgold,distance=..4,limit=1]","objective":"TC_lGold"}}'
execute as @s[tag=TC_outputobsidian] at @s run data modify block ^ ^1 ^2 Text1 set value '{"score":{"name":"@e[tag=TC_smeltery,tag=TC_outputobsidian,distance=..4,limit=1]","objective":"TC_lObsidian"}}'
execute as @s[tag=TC_outputirgol] at @s run data modify block ^ ^1 ^2 Text1 set value '{"score":{"name":"@e[tag=TC_smeltery,tag=TC_outputirgol,distance=..4,limit=1]","objective":"TC_lIrgol"}}'
execute as @s[tag=TC_outputobdiam] at @s run data modify block ^ ^1 ^2 Text1 set value '{"score":{"name":"@e[tag=TC_smeltery,tag=TC_outputobdiam,distance=..4,limit=1]","objective":"TC_lObdiam"}}'

# transfer parsed text into custom name
execute as @s[tag=!TC_outputnull] at @s run data modify entity @e[tag=TC_display,tag=TC_number,distance=..2,limit=1] CustomName set from block ^ ^1 ^2 Text1