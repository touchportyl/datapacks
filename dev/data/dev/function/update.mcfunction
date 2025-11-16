

# create
execute as @e[type=minecraft:endermite,name=Create] at @s run summon minecraft:armor_stand ~ ~ ~ {Tags:["seat"],Marker:1b,Invisible:0b,NoGravity:1b}
execute as @e[type=minecraft:endermite,name=Create] at @s run ride @p mount @n[tag=seat]
tp @e[type=minecraft:endermite,name=Create] ~ -65 ~
kill @e[type=minecraft:endermite,name=Create]

# remove
execute as @e[type=minecraft:endermite,name=Remove] at @s run kill @n[tag=seat]
tp @e[type=minecraft:endermite,name=Remove] ~ -65 ~
kill @e[type=minecraft:endermite,name=Remove]



# physics based movement
#scoreboard objectives add dev_speed dummy

# direction is the look direction of the armorstand

# input
execute as @a if predicate input:forward run scoreboard players add @n[tag=seat] dev_speed 4
execute as @a if predicate input:backward run scoreboard players remove @n[tag=seat] dev_speed 3


# tick physics
execute as @e[tag=seat] at @s unless score @s dev_speed matches 0 run scoreboard players operation @s dev_speed_ = @s dev_speed

execute as @e[tag=seat] at @s if score @s dev_speed_ matches 1.. run function dev:move_forward
execute as @e[tag=seat] at @s if score @s dev_speed_ matches ..-1 run function dev:move_backward


# decay
execute as @e[tag=seat] if score @s dev_speed matches 1.. run scoreboard players remove @s dev_speed 1
execute as @e[tag=seat] if score @s dev_speed matches ..-1 run scoreboard players add @s dev_speed 1



schedule function dev:update 1t