# Project created via BDEngine

# particle effects
execute as @e[tag=cruzer_seat,tag=has_uid,distance=..2] at @s run particle minecraft:block{block_state:{Name:"minecraft:iron_block"}} ^ ^ ^0.5 0.2 0.2 0.2 1 20
execute as @e[tag=cruzer_seat,tag=has_uid,distance=..2] at @s run particle minecraft:block{block_state:{Name:"minecraft:netherite_block"}} ^ ^ ^0.5 0.2 0.2 0.2 1 10
execute as @e[tag=cruzer_seat,tag=has_uid,distance=..2] at @s run particle minecraft:block{block_state:{Name:"minecraft:white_stained_glass"}} ^ ^ ^0.5 0.2 0.2 0.2 1 10

# sound effects
execute as @e[tag=cruzer_seat,tag=has_uid,distance=..2] at @s run playsound minecraft:item.armor.equip_iron block @a[distance=..64] ~ ~ ~ 0.7 1 0
execute as @e[tag=cruzer_seat,tag=has_uid,distance=..2] at @s run playsound minecraft:block.chain.break block @a[distance=..64] ~ ~ ~ 0.2 0.1 0
execute as @e[tag=cruzer_seat,tag=has_uid,distance=..2] at @s run playsound minecraft:block.iron.break block @a[distance=..64] ~ ~ ~ 0.8 0.1 0
execute as @e[tag=cruzer_seat,tag=has_uid,distance=..2] at @s run playsound minecraft:entity.happy_ghast.unequip block @a[distance=..64] ~ ~ ~ 0.9 1 0

# remove entities
execute as @e[tag=cruzer_seat,tag=has_uid,distance=..2] at @s as @e[tag=cruzer,tag=has_uid] if score @s ESF_vehicleID = @n[tag=cruzer_seat,tag=has_uid] ESF_vehicleID on passengers run kill @s
execute as @e[tag=cruzer_seat,tag=has_uid,distance=..2] at @s as @e[tag=cruzer,tag=has_uid] if score @s ESF_vehicleID = @n[tag=cruzer_seat,tag=has_uid] ESF_vehicleID run kill @s

execute as @e[tag=cruzer_seat,tag=has_uid,distance=..2] at @s as @e[tag=cruzer_interactable,tag=has_uid] if score @s ESF_vehicleID = @n[tag=cruzer_seat,tag=has_uid] ESF_vehicleID run kill @s
kill @e[tag=cruzer_seat,tag=has_uid,distance=..2]