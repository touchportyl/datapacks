# tags custom items based on the smeltery's conditions
# more metadata is always better, helps with item detection in the future


# material

execute as @s[tag=TC_outputiron] at @s positioned ^ ^ ^2 run tag @e[type=item,tag=TC_gen_item,distance=..0.2,sort=nearest,limit=1] add TC_gen_iron

execute as @s[tag=TC_outputgold] at @s positioned ^ ^ ^2 run tag @e[type=item,tag=TC_gen_item,distance=..0.2,sort=nearest,limit=1] add TC_gen_gold

execute as @s[tag=TC_outputirgol] at @s positioned ^ ^ ^2 run tag @e[type=item,tag=TC_gen_item,distance=..0.2,sort=nearest,limit=1] add TC_gen_irgol

execute as @s[tag=TC_outputobdiam] at @s positioned ^ ^ ^2 run tag @e[type=item,tag=TC_gen_item,distance=..0.2,sort=nearest,limit=1] add TC_gen_obdiam


# type

execute as @s[tag=TC_cauldron] at @s positioned ^ ^ ^2 run tag @e[type=item,tag=TC_gen_item,distance=..0.2,sort=nearest,limit=1] add TC_gen_cauldroncasted

execute as @s[tag=TC_anvil] at @s positioned ^ ^ ^2 run tag @e[type=item,tag=TC_gen_item,distance=..0.2,sort=nearest,limit=1] add TC_gen_anvilcasted


# tool type

execute as @s[tag=TC_pickaxe] at @s positioned ^ ^ ^2 run tag @e[type=item,tag=TC_gen_item,tag=TC_gen_anvilcasted,distance=..0.2,sort=nearest,limit=1] add TC_gen_pickaxe

execute as @s[tag=TC_sword] at @s positioned ^ ^ ^2 run tag @e[type=item,tag=TC_gen_item,tag=TC_gen_anvilcasted,distance=..0.2,sort=nearest,limit=1] add TC_gen_sword

execute as @s[tag=TC_axe] at @s positioned ^ ^ ^2 run tag @e[type=item,tag=TC_gen_item,tag=TC_gen_anvilcasted,distance=..0.2,sort=nearest,limit=1] add TC_gen_axe

execute as @s[tag=TC_shovel] at @s positioned ^ ^ ^2 run tag @e[type=item,tag=TC_gen_item,tag=TC_gen_anvilcasted,distance=..0.2,sort=nearest,limit=1] add TC_gen_shovel

execute as @s[tag=TC_hoe] at @s positioned ^ ^ ^2 run tag @e[type=item,tag=TC_gen_item,tag=TC_gen_anvilcasted,distance=..0.2,sort=nearest,limit=1] add TC_gen_hoe