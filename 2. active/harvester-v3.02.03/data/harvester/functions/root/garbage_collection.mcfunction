# this code removes all semi-persistent tags


tag @a remove HV_wood
tag @a remove HV_stone
tag @a remove HV_gold
tag @a remove HV_iron
tag @a remove HV_diamond
tag @a remove HV_netherite

tag @a remove HV_1x1
tag @a remove HV_3x3_star
tag @a remove HV_3x3
tag @a remove HV_5x5_star
tag @a remove HV_5x5
tag @a remove HV_nether

tag @a remove HV_wheat
tag @a remove HV_potato
tag @a remove HV_carrot
tag @a remove HV_beetroot
tag @a remove HV_netherwart

tag @a remove HV_success


# compatibility
execute if score VERSION$minecraft.current DatapackManager matches 14 run scoreboard players reset @a HV_sneak_time