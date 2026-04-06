#> -----------------------------------------------
#> Dimensional Doors Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> enter controller
# this code runs when a player or entity goes through a door


# close door
tag @e[tag=DD_portal,sort=nearest,limit=1] add DD_close

# direction detection
execute if entity @e[tag=DD_entrance,distance=..1,sort=nearest,limit=1] run tag @s add DD_enter+
execute if entity @e[tag=DD_exit,distance=..1,sort=nearest,limit=1] run tag @s add DD_enter-

# teleport player: entrance > exit
execute as @e[tag=DD_entrance] at @s at @e[tag=DD_enter+,distance=..1,limit=1] as @e[tag=DD_exit] if score @s DD_doorID = @e[tag=DD_entrance,limit=1,sort=nearest] DD_doorID run tp @e[tag=DD_enter+,distance=..1,sort=nearest,limit=1] @s

# teleport player: exit > entrance
execute as @e[tag=DD_exit] at @s at @e[tag=DD_enter-,distance=..1,limit=1] as @e[tag=DD_entrance] if score @s DD_doorID = @e[tag=DD_exit,limit=1,sort=nearest] DD_doorID run tp @e[tag=DD_enter-,distance=..1,sort=nearest,limit=1] @s

# 404 if teleport did not happen
execute as @e[tag=DD_entrance] at @s at @e[tag=DD_enter+,distance=..1,limit=1] run tag @e[tag=DD_enter+,distance=..1,limit=1,sort=nearest] add DD_door404
execute as @e[tag=DD_door404] run tag @s remove DD_enter+

# displace the player
# has the unintended side effect of displacing the player if the doors are too close
# this makes it more "realistic" as opening two connected wormholes next to each other would be unstable
execute as @e[tag=DD_door404] at @s run spreadplayers ~ ~ 0 1 false @s

#move to correct location
execute as @e[tag=DD_enter+] at @s run tp @s ^ ^ ^1

#blow up entrance if link thrown into entrance
execute as @e[type=minecraft:item,tag=DD_door404,name=Conduit,nbt={Item:{tag:{DD_Linked:1b}}}] at @s align xyz run function dimensionaldoors:modules/effects/destroy

#play teleport and closing door sound
execute as @e[tag=DD_enter] at @s run playsound minecraft:item.chorus_fruit.teleport player @s ~ ~ ~ 1 1 1
execute as @e[tag=DD_enter] at @s run playsound minecraft:block.wooden_door.close block @s ~ ~ ~ 1 1 1

# grant advancement
advancement grant @s only dimensionaldoors:adventure/dimensional_doors


#> End of file
#> -----------
