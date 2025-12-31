summon minecraft:text_display ~ ~ ~ {Tags:["RaceToTheEnd","RE_podium","RE_podium_title_text_display","RE_podium_title_text_display1"],text:[{"text":"Race to the End","bold":true}],background:0}
data modify entity @n[tag=RE_podium_title_text_display1] transformation.scale set value [10.0f,10.0f,10.0f]
summon minecraft:text_display ~ ~-1 ~-8.15 {Tags:["RaceToTheEnd","RE_podium","RE_podium_title_text_display","RE_podium_title_text_display2"],text:[{"text":"by touchportyl"}],background:0}
data modify entity @n[tag=RE_podium_title_text_display2] transformation.scale set value [4.0f,4.0f,4.0f]
execute as @e[tag=RE_podium_title_text_display] at @s run tp @s ~ ~ ~ -90 0