gamerule commandBlockOutput false





# add variables
# API hook "unless score TC_api_hash TC_api matches 101"
execute in minecraft:overworld as @a at @s if entity @s[nbt={SelectedItem:{id:"minecraft:diamond_hoe"}}] unless score TC_api_hash TC_api matches 101 run tag @s add H_harvesting

execute in minecraft:overworld as @a at @s if entity @s[nbt={Inventory:[{id:"minecraft:wheat_seeds"}]}] run tag @s add H_wheat
execute in minecraft:overworld as @a at @s if entity @s[nbt={Inventory:[{id:"minecraft:potato"}]}] run tag @s add H_potato
execute in minecraft:overworld as @a at @s if entity @s[nbt={Inventory:[{id:"minecraft:carrot"}]}] run tag @s add H_carrot
execute in minecraft:overworld as @a at @s if entity @s[nbt={Inventory:[{id:"minecraft:beetroot_seeds"}]}] run tag @s add H_beetroot


# randomizer
scoreboard players add @a[tag=H_harvesting] H_rand_2 1
scoreboard players set @a[tag=H_harvesting,scores={H_rand_2=5..}] H_rand_2 1


# wheat module
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_wheat] at @s if block ~ ~ ~ minecraft:farmland if block ~ ~1 ~ minecraft:wheat[age=7] if entity @s[scores={H_sneak_time=1..}] run tag @s add H_harvested

execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_wheat,scores={H_rand_2=1..3}] at @s if block ~ ~ ~ minecraft:farmland if block ~ ~1 ~ minecraft:wheat[age=7] if entity @s[scores={H_sneak_time=1..}] run clear @s minecraft:wheat_seeds 2
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_wheat,scores={H_rand_2=4}] at @s if block ~ ~ ~ minecraft:farmland if block ~ ~1 ~ minecraft:wheat[age=7] if entity @s[scores={H_sneak_time=1..}] run clear @s minecraft:wheat_seeds 3

execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_wheat] at @s if block ~ ~ ~ minecraft:farmland if block ~ ~1 ~ minecraft:wheat[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~ ~1 ~ minecraft:wheat[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_wheat] at @s if block ~1 ~ ~ minecraft:farmland if block ~1 ~1 ~ minecraft:wheat[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~1 ~1 ~ minecraft:wheat[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_wheat] at @s if block ~1 ~ ~1 minecraft:farmland if block ~1 ~1 ~1 minecraft:wheat[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~1 ~1 ~1 minecraft:wheat[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_wheat] at @s if block ~ ~ ~1 minecraft:farmland if block ~ ~1 ~1 minecraft:wheat[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~ ~1 ~1 minecraft:wheat[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_wheat] at @s if block ~-1 ~ ~1 minecraft:farmland if block ~-1 ~1 ~1 minecraft:wheat[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~-1 ~1 ~1 minecraft:wheat[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_wheat] at @s if block ~-1 ~ ~ minecraft:farmland if block ~-1 ~1 ~ minecraft:wheat[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~-1 ~1 ~ minecraft:wheat[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_wheat] at @s if block ~-1 ~ ~-1 minecraft:farmland if block ~-1 ~1 ~-1 minecraft:wheat[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~-1 ~1 ~-1 minecraft:wheat[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_wheat] at @s if block ~ ~ ~-1 minecraft:farmland if block ~ ~1 ~-1 minecraft:wheat[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~ ~1 ~-1 minecraft:wheat[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_wheat] at @s if block ~1 ~ ~-1 minecraft:farmland if block ~1 ~1 ~-1 minecraft:wheat[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~1 ~1 ~-1 minecraft:wheat[age=0] destroy

execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_wheat] at @s if block ~ ~ ~ minecraft:farmland if block ~ ~1 ~ minecraft:wheat[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~ ~1 ~ minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_wheat] at @s if block ~1 ~ ~ minecraft:farmland if block ~1 ~1 ~ minecraft:wheat[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~1 ~1 ~ minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_wheat] at @s if block ~1 ~ ~1 minecraft:farmland if block ~1 ~1 ~1 minecraft:wheat[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~1 ~1 ~1 minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_wheat] at @s if block ~ ~ ~1 minecraft:farmland if block ~ ~1 ~1 minecraft:wheat[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~ ~1 ~1 minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_wheat] at @s if block ~-1 ~ ~1 minecraft:farmland if block ~-1 ~1 ~1 minecraft:wheat[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~-1 ~1 ~1 minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_wheat] at @s if block ~-1 ~ ~ minecraft:farmland if block ~-1 ~1 ~ minecraft:wheat[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~-1 ~1 ~ minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_wheat] at @s if block ~-1 ~ ~-1 minecraft:farmland if block ~-1 ~1 ~-1 minecraft:wheat[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~-1 ~1 ~-1 minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_wheat] at @s if block ~ ~ ~-1 minecraft:farmland if block ~ ~1 ~-1 minecraft:wheat[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~ ~1 ~-1 minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_wheat] at @s if block ~1 ~ ~-1 minecraft:farmland if block ~1 ~1 ~-1 minecraft:wheat[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~1 ~1 ~-1 minecraft:air destroy


# potato module
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_potato] at @s if block ~ ~ ~ minecraft:farmland if block ~ ~1 ~ minecraft:potatoes[age=7] if entity @s[scores={H_sneak_time=1..}] run tag @s add H_harvested

execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_potato,scores={H_rand_2=1..3}] at @s if block ~ ~ ~ minecraft:farmland if block ~ ~1 ~ minecraft:potatoes[age=7] if entity @s[scores={H_sneak_time=1..}] run clear @s minecraft:potato 2
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_potato,scores={H_rand_2=4}] at @s if block ~ ~ ~ minecraft:farmland if block ~ ~1 ~ minecraft:potatoes[age=7] if entity @s[scores={H_sneak_time=1..}] run clear @s minecraft:potato 3

execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_potato] at @s if block ~ ~ ~ minecraft:farmland if block ~ ~1 ~ minecraft:potatoes[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~ ~1 ~ minecraft:potatoes[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_potato] at @s if block ~1 ~ ~ minecraft:farmland if block ~1 ~1 ~ minecraft:potatoes[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~1 ~1 ~ minecraft:potatoes[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_potato] at @s if block ~1 ~ ~1 minecraft:farmland if block ~1 ~1 ~1 minecraft:potatoes[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~1 ~1 ~1 minecraft:potatoes[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_potato] at @s if block ~ ~ ~1 minecraft:farmland if block ~ ~1 ~1 minecraft:potatoes[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~ ~1 ~1 minecraft:potatoes[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_potato] at @s if block ~-1 ~ ~1 minecraft:farmland if block ~-1 ~1 ~1 minecraft:potatoes[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~-1 ~1 ~1 minecraft:potatoes[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_potato] at @s if block ~-1 ~ ~ minecraft:farmland if block ~-1 ~1 ~ minecraft:potatoes[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~-1 ~1 ~ minecraft:potatoes[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_potato] at @s if block ~-1 ~ ~-1 minecraft:farmland if block ~-1 ~1 ~-1 minecraft:potatoes[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~-1 ~1 ~-1 minecraft:potatoes[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_potato] at @s if block ~ ~ ~-1 minecraft:farmland if block ~ ~1 ~-1 minecraft:potatoes[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~ ~1 ~-1 minecraft:potatoes[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_potato] at @s if block ~1 ~ ~-1 minecraft:farmland if block ~1 ~1 ~-1 minecraft:potatoes[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~1 ~1 ~-1 minecraft:potatoes[age=0] destroy

execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_potato] at @s if block ~ ~ ~ minecraft:farmland if block ~ ~1 ~ minecraft:potatoes[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~ ~1 ~ minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_potato] at @s if block ~1 ~ ~ minecraft:farmland if block ~1 ~1 ~ minecraft:potatoes[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~1 ~1 ~ minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_potato] at @s if block ~1 ~ ~1 minecraft:farmland if block ~1 ~1 ~1 minecraft:potatoes[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~1 ~1 ~1 minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_potato] at @s if block ~ ~ ~1 minecraft:farmland if block ~ ~1 ~1 minecraft:potatoes[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~ ~1 ~1 minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_potato] at @s if block ~-1 ~ ~1 minecraft:farmland if block ~-1 ~1 ~1 minecraft:potatoes[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~-1 ~1 ~1 minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_potato] at @s if block ~-1 ~ ~ minecraft:farmland if block ~-1 ~1 ~ minecraft:potatoes[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~-1 ~1 ~ minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_potato] at @s if block ~-1 ~ ~-1 minecraft:farmland if block ~-1 ~1 ~-1 minecraft:potatoes[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~-1 ~1 ~-1 minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_potato] at @s if block ~ ~ ~-1 minecraft:farmland if block ~ ~1 ~-1 minecraft:potatoes[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~ ~1 ~-1 minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_potato] at @s if block ~1 ~ ~-1 minecraft:farmland if block ~1 ~1 ~-1 minecraft:potatoes[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~1 ~1 ~-1 minecraft:air destroy


# carrot module
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_carrot] at @s if block ~ ~ ~ minecraft:farmland if block ~ ~1 ~ minecraft:carrots[age=7] if entity @s[scores={H_sneak_time=1..}] run tag @s add H_harvested

execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_carrot,scores={H_rand_2=1..3}] at @s if block ~ ~ ~ minecraft:farmland if block ~ ~1 ~ minecraft:carrots[age=7] if entity @s[scores={H_sneak_time=1..}] run clear @s minecraft:carrot 2
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_carrot,scores={H_rand_2=4}] at @s if block ~ ~ ~ minecraft:farmland if block ~ ~1 ~ minecraft:carrots[age=7] if entity @s[scores={H_sneak_time=1..}] run clear @s minecraft:carrot 3

execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_carrot] at @s if block ~ ~ ~ minecraft:farmland if block ~ ~1 ~ minecraft:carrots[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~ ~1 ~ minecraft:carrots[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_carrot] at @s if block ~1 ~ ~ minecraft:farmland if block ~1 ~1 ~ minecraft:carrots[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~1 ~1 ~ minecraft:carrots[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_carrot] at @s if block ~1 ~ ~1 minecraft:farmland if block ~1 ~1 ~1 minecraft:carrots[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~1 ~1 ~1 minecraft:carrots[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_carrot] at @s if block ~ ~ ~1 minecraft:farmland if block ~ ~1 ~1 minecraft:carrots[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~ ~1 ~1 minecraft:carrots[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_carrot] at @s if block ~-1 ~ ~1 minecraft:farmland if block ~-1 ~1 ~1 minecraft:carrots[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~-1 ~1 ~1 minecraft:carrots[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_carrot] at @s if block ~-1 ~ ~ minecraft:farmland if block ~-1 ~1 ~ minecraft:carrots[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~-1 ~1 ~ minecraft:carrots[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_carrot] at @s if block ~-1 ~ ~-1 minecraft:farmland if block ~-1 ~1 ~-1 minecraft:carrots[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~-1 ~1 ~-1 minecraft:carrots[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_carrot] at @s if block ~ ~ ~-1 minecraft:farmland if block ~ ~1 ~-1 minecraft:carrots[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~ ~1 ~-1 minecraft:carrots[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_carrot] at @s if block ~1 ~ ~-1 minecraft:farmland if block ~1 ~1 ~-1 minecraft:carrots[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~1 ~1 ~-1 minecraft:carrots[age=0] destroy

execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_carrot] at @s if block ~ ~ ~ minecraft:farmland if block ~ ~1 ~ minecraft:carrots[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~ ~1 ~ minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_carrot] at @s if block ~1 ~ ~ minecraft:farmland if block ~1 ~1 ~ minecraft:carrots[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~1 ~1 ~ minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_carrot] at @s if block ~1 ~ ~1 minecraft:farmland if block ~1 ~1 ~1 minecraft:carrots[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~1 ~1 ~1 minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_carrot] at @s if block ~ ~ ~1 minecraft:farmland if block ~ ~1 ~1 minecraft:carrots[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~ ~1 ~1 minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_carrot] at @s if block ~-1 ~ ~1 minecraft:farmland if block ~-1 ~1 ~1 minecraft:carrots[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~-1 ~1 ~1 minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_carrot] at @s if block ~-1 ~ ~ minecraft:farmland if block ~-1 ~1 ~ minecraft:carrots[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~-1 ~1 ~ minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_carrot] at @s if block ~-1 ~ ~-1 minecraft:farmland if block ~-1 ~1 ~-1 minecraft:carrots[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~-1 ~1 ~-1 minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_carrot] at @s if block ~ ~ ~-1 minecraft:farmland if block ~ ~1 ~-1 minecraft:carrots[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~ ~1 ~-1 minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_carrot] at @s if block ~1 ~ ~-1 minecraft:farmland if block ~1 ~1 ~-1 minecraft:carrots[age=7] if entity @s[scores={H_sneak_time=1..}] run setblock ~1 ~1 ~-1 minecraft:air destroy


# beetroot module
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_beetroot] at @s if block ~ ~ ~ minecraft:farmland if block ~ ~1 ~ minecraft:beetroots[age=3] if entity @s[scores={H_sneak_time=1..}] run tag @s add H_harvested

execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_beetroot,scores={H_rand_2=1..3}] at @s if block ~ ~ ~ minecraft:farmland if block ~ ~1 ~ minecraft:beetroots[age=3] if entity @s[scores={H_sneak_time=1..}] run clear @s minecraft:beetroot_seeds 2
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_beetroot,scores={H_rand_2=4}] at @s if block ~ ~ ~ minecraft:farmland if block ~ ~1 ~ minecraft:beetroots[age=3] if entity @s[scores={H_sneak_time=1..}] run clear @s minecraft:beetroot_seeds 3

execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_beetroot] at @s if block ~ ~ ~ minecraft:farmland if block ~ ~1 ~ minecraft:beetroots[age=3] if entity @s[scores={H_sneak_time=1..}] run setblock ~ ~1 ~ minecraft:beetroots[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_beetroot] at @s if block ~1 ~ ~ minecraft:farmland if block ~1 ~1 ~ minecraft:beetroots[age=3] if entity @s[scores={H_sneak_time=1..}] run setblock ~1 ~1 ~ minecraft:beetroots[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_beetroot] at @s if block ~1 ~ ~1 minecraft:farmland if block ~1 ~1 ~1 minecraft:beetroots[age=3] if entity @s[scores={H_sneak_time=1..}] run setblock ~1 ~1 ~1 minecraft:beetroots[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_beetroot] at @s if block ~ ~ ~1 minecraft:farmland if block ~ ~1 ~1 minecraft:beetroots[age=3] if entity @s[scores={H_sneak_time=1..}] run setblock ~ ~1 ~1 minecraft:beetroots[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_beetroot] at @s if block ~-1 ~ ~1 minecraft:farmland if block ~-1 ~1 ~1 minecraft:beetroots[age=3] if entity @s[scores={H_sneak_time=1..}] run setblock ~-1 ~1 ~1 minecraft:beetroots[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_beetroot] at @s if block ~-1 ~ ~ minecraft:farmland if block ~-1 ~1 ~ minecraft:beetroots[age=3] if entity @s[scores={H_sneak_time=1..}] run setblock ~-1 ~1 ~ minecraft:beetroots[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_beetroot] at @s if block ~-1 ~ ~-1 minecraft:farmland if block ~-1 ~1 ~-1 minecraft:beetroots[age=3] if entity @s[scores={H_sneak_time=1..}] run setblock ~-1 ~1 ~-1 minecraft:beetroots[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_beetroot] at @s if block ~ ~ ~-1 minecraft:farmland if block ~ ~1 ~-1 minecraft:beetroots[age=3] if entity @s[scores={H_sneak_time=1..}] run setblock ~ ~1 ~-1 minecraft:beetroots[age=0] destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=H_beetroot] at @s if block ~1 ~ ~-1 minecraft:farmland if block ~1 ~1 ~-1 minecraft:beetroots[age=3] if entity @s[scores={H_sneak_time=1..}] run setblock ~1 ~1 ~-1 minecraft:beetroots[age=0] destroy

execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_beetroot] at @s if block ~ ~ ~ minecraft:farmland if block ~ ~1 ~ minecraft:beetroots[age=3] if entity @s[scores={H_sneak_time=1..}] run setblock ~ ~1 ~ minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_beetroot] at @s if block ~1 ~ ~ minecraft:farmland if block ~1 ~1 ~ minecraft:beetroots[age=3] if entity @s[scores={H_sneak_time=1..}] run setblock ~1 ~1 ~ minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_beetroot] at @s if block ~1 ~ ~1 minecraft:farmland if block ~1 ~1 ~1 minecraft:beetroots[age=3] if entity @s[scores={H_sneak_time=1..}] run setblock ~1 ~1 ~1 minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_beetroot] at @s if block ~ ~ ~1 minecraft:farmland if block ~ ~1 ~1 minecraft:beetroots[age=3] if entity @s[scores={H_sneak_time=1..}] run setblock ~ ~1 ~1 minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_beetroot] at @s if block ~-1 ~ ~1 minecraft:farmland if block ~-1 ~1 ~1 minecraft:beetroots[age=3] if entity @s[scores={H_sneak_time=1..}] run setblock ~-1 ~1 ~1 minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_beetroot] at @s if block ~-1 ~ ~ minecraft:farmland if block ~-1 ~1 ~ minecraft:beetroots[age=3] if entity @s[scores={H_sneak_time=1..}] run setblock ~-1 ~1 ~ minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_beetroot] at @s if block ~-1 ~ ~-1 minecraft:farmland if block ~-1 ~1 ~-1 minecraft:beetroots[age=3] if entity @s[scores={H_sneak_time=1..}] run setblock ~-1 ~1 ~-1 minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_beetroot] at @s if block ~ ~ ~-1 minecraft:farmland if block ~ ~1 ~-1 minecraft:beetroots[age=3] if entity @s[scores={H_sneak_time=1..}] run setblock ~ ~1 ~-1 minecraft:air destroy
execute in minecraft:overworld as @a[tag=H_harvesting,tag=!H_beetroot] at @s if block ~1 ~ ~-1 minecraft:farmland if block ~1 ~1 ~-1 minecraft:beetroots[age=3] if entity @s[scores={H_sneak_time=1..}] run setblock ~1 ~1 ~-1 minecraft:air destroy


# harvest success feedback
execute in minecraft:overworld as @a[tag=H_harvested] at @s run playsound minecraft:entity.player.attack.sweep block @a ~ ~ ~ 0.7 1.6 0
execute in minecraft:overworld as @a[tag=H_harvested] at @s run playsound minecraft:entity.experience_orb.pickup block @a ~ ~ ~ 1 1.6 0
execute in minecraft:overworld as @a[tag=H_harvested] at @s run particle minecraft:sweep_attack ~ ~0.5 ~ 0 0 0 0.1 3


# clear cache
execute in minecraft:overworld as @a at @s run tag @s remove H_harvesting
execute in minecraft:overworld as @a at @s run tag @s remove H_wheat
execute in minecraft:overworld as @a at @s run tag @s remove H_potato
execute in minecraft:overworld as @a at @s run tag @s remove H_carrot
execute in minecraft:overworld as @a at @s run tag @s remove H_beetroot
execute in minecraft:overworld as @a at @s run tag @s remove H_harvested
execute in minecraft:overworld as @a[scores={H_sneak_time=1..}] run scoreboard players reset @s H_sneak_time


gamerule commandBlockOutput true
