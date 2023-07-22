# wax the sign to prevent editing
# just in case
# no one's ever going to be able to be fast enough to inject values this way anyways
data modify block ^ ^1 ^2 is_waxed set value true

# parse scoreboard on sign back_text.messages[0]
data modify block ^ ^1 ^2 back_text.messages[0] set value '[{"text":"","color":"gray","italic":false},{"text":"Casted by "},{"selector":"@p"}]'

# transfer parsed text into lore
data modify entity @e[tag=TC_gen_casted,distance=..3,limit=1,sort=nearest] Item.tag.display.Lore append from block ^ ^1 ^2 back_text.messages[0]