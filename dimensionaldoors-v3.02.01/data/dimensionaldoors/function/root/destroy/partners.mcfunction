# tag every portal that shares this portal's door ID
scoreboard players operation TEMP$doorID DD_doorID = @s DD_doorID
execute as @e[tag=DD_portal] if score @s DD_doorID = TEMP$doorID DD_doorID run tag @s add DD_destroy
scoreboard players reset TEMP$doorID DD_doorID
