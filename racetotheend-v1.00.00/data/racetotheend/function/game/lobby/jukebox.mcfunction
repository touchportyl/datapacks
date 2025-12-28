setblock ~ ~ ~ minecraft:jukebox
setblock ~ ~1 ~ minecraft:light[level=15]
setblock ~ ~2 ~ minecraft:barrier

# song display
summon minecraft:text_display ~ ~1.8 ~ {Tags:["RaceToTheEnd","RE_lobby","RE_lobby_jukebox_text_display1"],text:[{"text":"♫ JukeBox by touchportyl ♫"}]}
summon minecraft:text_display ~ ~1.45 ~ {Tags:["RaceToTheEnd","RE_lobby","RE_lobby_jukebox_text_display2"],text:[{"text":"Not playing."}]}
execute as @n[tag=RE_lobby_jukebox_text_display1] at @s run tp @s ~ ~ ~ ~180 ~
execute as @n[tag=RE_lobby_jukebox_text_display2] at @s run tp @s ~ ~ ~ ~180 ~

# stop interaction
summon minecraft:interaction ~1.27 ~0.77 ~-0.1 {Tags:["RaceToTheEnd","RE_lobby","RE_lobby_jukebox_interaction_stop"],width:0.4f,height:0.4f,response:1b}
summon minecraft:text_display ~1.3 ~0.7 ~-0.1 {Tags:["RaceToTheEnd","RE_lobby","RE_lobby_jukebox_text_display_stop"],text:[{"text":"🔇","color":"red"}],background:0}
data modify entity @n[tag=RE_lobby_jukebox_text_display_stop] transformation.scale set value [2.0f,2.0f,2.0f]
execute as @n[tag=RE_lobby_jukebox_text_display_stop] at @s run tp @s ~ ~ ~ ~150 ~

# next interaction
summon minecraft:interaction ~-1.32 ~0.77 ~-0.1 {Tags:["RaceToTheEnd","RE_lobby","RE_lobby_jukebox_interaction_next"],width:0.4f,height:0.4f,response:1b}
summon minecraft:text_display ~-1.3 ~0.68 ~-0.1 {Tags:["RaceToTheEnd","RE_lobby","RE_lobby_jukebox_text_display_next"],text:[{"text":"⏩","color":"green"}],background:0}
data modify entity @n[tag=RE_lobby_jukebox_text_display_next] transformation.scale set value [2.0f,2.0f,2.0f]
execute as @n[tag=RE_lobby_jukebox_text_display_next] at @s run tp @s ~ ~ ~ ~210 ~