summon minecraft:mannequin ~ ~ ~ {Tags:["RaceToTheEnd","RE_podium","RE_podium_mannequin"],immovable:1b,Invulnerable:1b}
execute as @n[tag=RE_podium_mannequin] run function racetotheend:_packages/nocollision/join
data modify entity @n[tag=RE_podium_mannequin] profile.id set value [I; 726676027, 557139258, -2095532250, -538625195]
effect give @n[tag=RE_podium_mannequin] minecraft:resistance infinite 255 true

execute at @n[tag=RE_podium_mannequin] run summon minecraft:text_display ~ ~2.1 ~ {Tags:["RaceToTheEnd","RE_podium","RE_podium_mannequin_text_display"],text:[{"selector":"@p[tag=RE_winner]","color":"light_purple"}],billboard:"center"}

execute as @n[tag=RE_podium_mannequin] at @s run tp @s ~ ~ ~ ~-90 ~-10

fill ~ ~ ~ ~ ~2 ~ minecraft:barrier
setblock ~1 ~1 ~ minecraft:light[level=15]