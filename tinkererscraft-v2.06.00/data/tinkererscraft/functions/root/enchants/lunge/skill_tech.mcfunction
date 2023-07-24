# gives the player the tech boost for the lunge skill


# advancement
advancement grant @s until tinkererscraft:skills/lunge_tech

# potion effects
effect give @s minecraft:speed 7 3 true
effect give @s minecraft:jump_boost 1 1 true

#fx:boom
particle minecraft:explosion ~ ~0.2 ~ 0 0 0 0 1 force
playsound entity.generic.explode block @a[distance=..15] ~ ~ ~ 0.5 2 0

# pfx
scoreboard players set @s TC_SmeltingTimer 60