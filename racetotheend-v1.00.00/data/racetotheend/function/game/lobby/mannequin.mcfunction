setblock ~ ~ ~ minecraft:gold_block

summon minecraft:mannequin ~ ~1 ~ {Tags:["RaceToTheEnd","RE_lobby","RE_lobby_mannequin"],immovable:1b,Invulnerable:0b}
execute as @n[tag=RE_lobby_mannequin] run function racetotheend:_packages/nocollision/join
data modify entity @n[tag=RE_lobby_mannequin] profile.id set value [I; 726676027, 557139258, -2095532250, -538625195]

execute at @n[tag=RE_lobby_mannequin] run summon minecraft:text_display ~ ~2.1 ~ {Tags:["RaceToTheEnd","RE_lobby","RE_lobby_mannequin_text_display"],text:[{"text":"touchportyl","color":"light_purple"}],billboard:"center"}

setblock ~ ~1 ~ minecraft:barrier
setblock ~ ~2 ~ minecraft:light[level=15]
setblock ~ ~3 ~ minecraft:barrier

# setup interaction
summon minecraft:interaction ~ ~2 ~ {Tags:["RaceToTheEnd","RE_lobby","RE_lobby_mannequin_interaction"],width:0.8f,height:1f,response:1b}