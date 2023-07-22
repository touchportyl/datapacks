# parse scoreboard on sign Text1
data modify block ^ ^1 ^2 Text1 set value '[{"text":"","color":"gray","italic":false},{"text":"Casted by "},{"selector":"@p"}]'

# transfer parsed text into lore
data modify entity @e[tag=TC_gen_casted,distance=..3,limit=1,sort=nearest] Item.tag.display.Lore append from block ^ ^1 ^2 Text1