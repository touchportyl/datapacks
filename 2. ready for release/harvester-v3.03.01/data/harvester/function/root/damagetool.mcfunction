# applies 1 damage to the tool

# read current Damage into a scoreboard
execute if score VERSION$minecraft.current DatapackManager matches ..12005 store result score @s HV_damagetool run data get entity @s SelectedItem.tag.Damage 1
execute unless score VERSION$minecraft.current DatapackManager matches ..12005 store result score @s HV_damagetool run data get entity @s SelectedItem.components.minecraft:damage 1

# clear temp scores
scoreboard players reset TEMP$a HV_damagetool
scoreboard players reset TEMP$b HV_damagetool

# get max durability
execute if entity @s[tag=HV_wood] run scoreboard players set TEMP$a HV_damagetool 59
execute if entity @s[tag=HV_gold] run scoreboard players set TEMP$a HV_damagetool 32
execute if entity @s[tag=HV_stone] run scoreboard players set TEMP$a HV_damagetool 131
execute if entity @s[tag=HV_iron] run scoreboard players set TEMP$a HV_damagetool 251
execute if entity @s[tag=HV_diamond] run scoreboard players set TEMP$a HV_damagetool 1561
execute if entity @s[tag=HV_netherite] run scoreboard players set TEMP$a HV_damagetool 2031

# convert Damage to Durability
scoreboard players operation TEMP$b HV_damagetool = TEMP$a HV_damagetool
scoreboard players operation TEMP$b HV_damagetool -= @s HV_damagetool
scoreboard players operation @s HV_damagetool = TEMP$b HV_damagetool

# reduce durability by 1
scoreboard players remove @s HV_damagetool 1

# break tool if needed
execute if score @s HV_damagetool matches ..0 as @s at @s run function harvester:effects/toolbreak
# continue
execute unless score @s HV_damagetool matches ..0 run function harvester:root/damagetool2

# clear temp scores
scoreboard players reset TEMP$a HV_damagetool
scoreboard players reset TEMP$b HV_damagetool