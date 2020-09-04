gamerule commandBlockOutput false


#> initialize successful

scoreboard players set @a DD_init 1

tellraw @a[scores={DD_init=1}] [{"text":""},{"text":"   +","color":"light_purple","hoverEvent":{"action":"show_text","value":"Created by touchportal!"}},{"text":" [Dimensional Doors] ","color":"aqua","hoverEvent":{"action":"show_text","value":"The elegant solution to /sethome."}},{"text":"loaded!"}]

execute as @a[scores={DD_init=1}] run scoreboard objectives remove DD_init


#> door orientation detection and creation

#if floor + door + not on portal marker, add tag
execute in minecraft:overworld as @e[type=minecraft:item,name=Conduit,nbt={OnGround:1b}] at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true] unless entity @e[tag=DD_portal,distance=..1] run tag @s add DD_generator

execute in minecraft:overworld as @e[type=minecraft:item,name=Conduit,nbt={Item:{tag:{DD_Linked:1b}},OnGround:1b}] at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true] unless entity @e[tag=DD_portal,distance=..1] run tag @s add DD_generatorLink

#if generator, increase DD_doorID.$current by 1
execute in minecraft:overworld as @e[tag=DD_generator,tag=!DD_generatorLink] run scoreboard players add DD_doorID.$current DD_doorID 1

#> create portal entrance

execute in minecraft:overworld as @e[tag=DD_generator] at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true,facing=north,hinge=left] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_left","DD_NS","DD_new","DD_close"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute in minecraft:overworld as @e[tag=DD_generator] at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true,facing=south,hinge=left] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_left","DD_NS","DD_new","DD_close"],Rotation:[180f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

execute in minecraft:overworld as @e[tag=DD_generator] at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true,facing=east,hinge=left] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_left","DD_EW","DD_new","DD_close"],Rotation:[90f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute in minecraft:overworld as @e[tag=DD_generator] at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true,facing=west,hinge=left] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_left","DD_EW","DD_new","DD_close"],Rotation:[270f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

execute in minecraft:overworld as @e[tag=DD_generator] at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true,facing=north,hinge=right] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_right","DD_NS","DD_new","DD_close"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute in minecraft:overworld as @e[tag=DD_generator] at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true,facing=south,hinge=right] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_right","DD_NS","DD_new","DD_close"],Rotation:[180f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

execute in minecraft:overworld as @e[tag=DD_generator] at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true,facing=east,hinge=right] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_right","DD_EW","DD_new","DD_close"],Rotation:[90f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute in minecraft:overworld as @e[tag=DD_generator] at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true,facing=west,hinge=right] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_right","DD_EW","DD_new","DD_close"],Rotation:[270f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}


#> generators tag door with appropriate tags

execute in minecraft:overworld as @e[tag=DD_generator,tag=!DD_generatorLink] at @s run tag @e[tag=DD_new,distance=..1,limit=1] add DD_entrance

execute in minecraft:overworld as @e[tag=DD_generatorLink] at @s run tag @e[tag=DD_new,distance=..1,limit=1] add DD_exit


execute in minecraft:overworld as @e[tag=DD_generator,tag=!DD_generatorLink] at @s run tag @e[tag=DD_new,distance=..1,limit=1] add DD_generateID

execute in minecraft:overworld as @e[tag=DD_generatorLink] at @s run tag @e[tag=DD_new,distance=..1,limit=1] add DD_copyID


#tag linking conduit with DD_doorID
execute in minecraft:overworld as @e[tag=DD_generateLink] store result entity @s Item.tag.DD_doorID int 1 run scoreboard players get DD_doorID.$current DD_doorID

#remove tag
execute in minecraft:overworld as @e[tag=DD_generateLink] at @s run tag @s remove DD_generateLink


#> generate doorID for new doors

execute in minecraft:overworld as @e[tag=DD_generateID] at @s run scoreboard players operation @s DD_doorID = DD_doorID.$current DD_doorID

#remove tag
execute in minecraft:overworld as @e[tag=DD_generateID] at @s run tag @s remove DD_generateID


#> copy doorID for linking doors

execute in minecraft:overworld as @e[tag=DD_copyID] at @s store result score @s DD_doorID run data get entity @e[nbt={Item:{tag:{DD_Linked:1b}}},limit=1,sort=nearest] Item.tag.DD_doorID

#remove tag
execute in minecraft:overworld as @e[tag=DD_copyID] at @s run tag @s remove DD_copyID


#if new, remove generator item
execute in minecraft:overworld as @e[tag=DD_new] at @s run kill @e[tag=DD_generator,distance=..1,limit=1]

#if new, forceload chunk
execute in minecraft:overworld as @e[tag=DD_new] at @s run forceload add ~ ~

#if new entrance, summon linking conduit
execute in minecraft:overworld as @e[tag=DD_new,tag=DD_entrance] at @s run summon minecraft:item ^ ^ ^1 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:conduit",Count:1,tag:{DD_Linked:1b,display:{Name:'{"text":"Entangled Conduit","color":"light_purple","italic":"false"}',Lore:['','{"text":"This conduit\'s quantum state","color":"gray","italic":"false"}','{"text":"is entangled to a dimensional","color":"gray","italic":"false"}','{"text":"door","color":"gray","italic":"false"}','{"text":" "}','{"text":"Quantum state: ","color":"dark_gray","italic":"false","extra":[{"text":"entangled","color":"dark_gray","obfuscated":"true"}]}']}}},Tags:["DimensionalDoors","DD_generateLink","DD_particleLink"],PickupDelay:40}

#grant advancement
execute in minecraft:overworld as @e[tag=DD_new] at @s run advancement grant @a[distance=..7] only dimensionaldoors:adventure/create_door

#remove new tag
execute in minecraft:overworld as @e[tag=DD_new] at @s run tag @s remove DD_new


#> door particles

execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_NS] at @s positioned ^ ^1.7 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=false] run particle minecraft:underwater ~ ~ ~ 0.12 0.11 0.02 0 70 force
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_NS] at @s positioned ^ ^1.1 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=true] run particle minecraft:underwater ~ ~ ~ 0.12 0.26 0.02 0 420 force
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_NS] at @s positioned ^ ^1.1 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=true] run particle minecraft:portal ~ ~ ~ 0.12 0.26 0.02 0.35 1 normal

execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_EW] at @s positioned ^ ^1.7 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=false] run particle minecraft:underwater ~ ~ ~ 0.02 0.11 0.12 0 70 force
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_EW] at @s positioned ^ ^1.1 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=true] run particle minecraft:underwater ~ ~ ~ 0.02 0.26 0.12 0 420 force
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_EW] at @s positioned ^ ^1.1 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=true] run particle minecraft:portal ~ ~ ~ 0.02 0.26 0.12 0.35 1 normal


#> linking conduit particles

execute in minecraft:overworld as @e[tag=DD_particleLink] at @s run particle minecraft:portal ~ ~0.45 ~ 0 0 0 0.05 1 normal


#> portal detection

execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_left] at @s positioned ^0.5 ^0.2 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_left] at @s positioned ^0.15 ^0.2 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_left] at @s positioned ^0.5 ^0.45 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_left] at @s positioned ^0.15 ^0.45 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_left] at @s positioned ^0.5 ^0.7 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_left] at @s positioned ^0.15 ^0.7 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_left] at @s positioned ^0.5 ^0.95 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_left] at @s positioned ^0.15 ^0.95 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_left] at @s positioned ^0.5 ^1.2 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_left] at @s positioned ^0.15 ^1.2 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter

execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_right] at @s positioned ^-0.5 ^0.2 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_right] at @s positioned ^-0.15 ^0.2 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_right] at @s positioned ^-0.5 ^0.45 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_right] at @s positioned ^-0.15 ^0.45 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_right] at @s positioned ^-0.5 ^0.7 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_right] at @s positioned ^-0.15 ^0.7 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_right] at @s positioned ^-0.5 ^0.95 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_right] at @s positioned ^-0.15 ^0.95 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_right] at @s positioned ^-0.5 ^1.2 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_right] at @s positioned ^-0.15 ^1.2 ^0.425 run tag @e[tag=!DD_portal,distance=..0.3] add DD_enter

#grant advancement
execute in minecraft:overworld run advancement grant @a[tag=DD_enter] only dimensionaldoors:adventure/dimensional_doors


#> portal execution

#close door
execute in minecraft:overworld as @e[tag=DD_enter] at @s run tag @e[tag=DD_portal,sort=nearest,limit=1] add DD_close

#direction detection
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_entrance] at @s run tag @e[tag=DD_enter,distance=..1,sort=nearest] add DD_enter+
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_exit] at @s run tag @e[tag=DD_enter,distance=..1,sort=nearest] add DD_enter-


#teleport player: entrance > exit
execute in minecraft:overworld as @e[tag=DD_entrance] at @s at @e[tag=DD_enter+,distance=..1,limit=1] as @e[tag=DD_exit] if score @s DD_doorID = @e[tag=DD_entrance,limit=1,sort=nearest] DD_doorID run tp @e[tag=DD_enter+,distance=..1,limit=1,sort=nearest] @s

#404 if teleport did not happen
execute in minecraft:overworld as @e[tag=DD_entrance] at @s at @e[tag=DD_enter+,distance=..1,limit=1] run tag @e[tag=DD_enter+,distance=..1,limit=1,sort=nearest] add DD_door404
execute in minecraft:overworld as @e[tag=DD_door404] run tag @s remove DD_enter+

#blow up entrance if link thrown into entrance
execute as @e[type=minecraft:item,tag=DD_door404,name=Conduit,nbt={Item:{tag:{DD_Linked:1b}}}] at @s align xyz run summon minecraft:fireball ~0.5 ~0.5 ~0.5 {Motion:[0.0,-10.0,0.0],ExplosionPower:2,ExplosionRadius:2}

#displace the player
#has the unintended side effect of displacing the player if the doors are too close
#this makes it more "realistic" as opening two connected wormholes next to each other would be unstable
execute in minecraft:overworld as @e[tag=DD_door404] at @s run spreadplayers ~ ~ 0 1 false @s

#move to correct location
execute in minecraft:overworld as @e[tag=DD_enter+] at @s run tp @s ^ ^ ^1


#teleport player: exit > entrance
execute in minecraft:overworld as @e[tag=DD_exit] at @s at @e[tag=DD_enter-,distance=..1,limit=1] as @e[tag=DD_entrance] if score @s DD_doorID = @e[tag=DD_exit,limit=1,sort=nearest] DD_doorID run tp @e[tag=DD_enter-,distance=..1,limit=1,sort=nearest] @s

#move to correct location
execute in minecraft:overworld as @e[tag=DD_enter-] at @s run tp @s ^ ^ ^1


#play teleport and closing door sound
execute in minecraft:overworld as @e[tag=DD_enter] at @s run playsound minecraft:item.chorus_fruit.teleport player @s ~ ~ ~ 1 1 1
execute in minecraft:overworld as @e[tag=DD_enter] at @s run playsound minecraft:block.wooden_door.close block @s ~ ~ ~ 1 1 1


# door closer mechanism (1.15.2)

#execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=north,hinge=left] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=north,hinge=left] replace
#execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=south,hinge=left] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=south,hinge=left] replace
#execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=east,hinge=left] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=east,hinge=left] replace
#execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=west,hinge=left] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=west,hinge=left] replace

#execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=north,hinge=right] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=north,hinge=right] replace
#execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=south,hinge=right] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=south,hinge=right] replace
#execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=east,hinge=right] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=east,hinge=right] replace
#execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=west,hinge=right] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=west,hinge=right] replace

# door closer mechanism (1.16-rc1)

execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=north,hinge=left] run setblock ~ ~ ~ oak_door[open=false,facing=north,hinge=left,half=lower] destroy
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_close] at @s run setblock ~ ~1 ~ oak_door[open=false,facing=north,hinge=left,half=upper] replace

execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=south,hinge=left] run setblock ~ ~ ~ oak_door[open=false,facing=south,hinge=left,half=lower] destroy
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_close] at @s run setblock ~ ~1 ~ oak_door[open=false,facing=south,hinge=left,half=upper] replace

execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=east,hinge=left] run setblock ~ ~ ~ oak_door[open=false,facing=east,hinge=left,half=lower] destroy
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_close] at @s run setblock ~ ~1 ~ oak_door[open=false,facing=east,hinge=left,half=upper] replace

execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=west,hinge=left] run setblock ~ ~ ~ oak_door[open=false,facing=west,hinge=left,half=lower] destroy
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_close] at @s run setblock ~ ~1 ~ oak_door[open=false,facing=west,hinge=left,half=upper] replace


execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=north,hinge=right] run setblock ~ ~ ~ oak_door[open=false,facing=north,hinge=right,half=lower] destroy
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_close] at @s run setblock ~ ~1 ~ oak_door[open=false,facing=north,hinge=right,half=upper] replace

execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=south,hinge=right] run setblock ~ ~ ~ oak_door[open=false,facing=south,hinge=right,half=lower] destroy
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_close] at @s run setblock ~ ~1 ~ oak_door[open=false,facing=south,hinge=right,half=upper] replace

execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=east,hinge=right] run setblock ~ ~ ~ oak_door[open=false,facing=east,hinge=right,half=lower] destroy
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_close] at @s run setblock ~ ~1 ~ oak_door[open=false,facing=east,hinge=right,half=upper] replace

execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=west,hinge=right] run setblock ~ ~ ~ oak_door[open=false,facing=west,hinge=right,half=lower] destroy
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_close] at @s run setblock ~ ~1 ~ oak_door[open=false,facing=west,hinge=right,half=upper] replace

#kill door
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_close] at @s run kill @e[type=minecraft:item,name="Oak Door",limit=1,sort=nearest,nbt={Age:0s}]

#door closing sound
execute in minecraft:overworld as @e[tag=DD_portal,tag=DD_close] at @s run playsound minecraft:block.wooden_door.close block @a ~ ~ ~ 1 1 1


# pocket dimensions opener and closer mechanism (1.16-rc1)

#used for testing range
#execute as @e[tag=DD_portal_p] at @s if entity @a[name=touchportal,distance=..2] run tag @s add DD_open
#execute as @e[tag=DD_portal_p] at @s unless entity @a[name=touchportal,distance=..2] run tag @s add DD_close

#door sounds
#execute in minecraft:overworld as @e[tag=DD_portal_p,tag=DD_open] at @s if block ~ ~ ~ minecraft:iron_door[open=false,facing=north,hinge=left] run playsound minecraft:block.iron_door.open block @a ~ ~ ~ 1 1 1
#execute in minecraft:overworld as @e[tag=DD_portal_p,tag=DD_close] at @s if block ~ ~ ~ minecraft:iron_door[open=true,facing=north,hinge=left] run playsound minecraft:block.iron_door.close block @a ~ ~ ~ 1 1 1

#open
#execute in minecraft:overworld as @e[tag=DD_portal_p,tag=DD_open] at @s if block ~ ~ ~ minecraft:iron_door[open=false,facing=north,hinge=left] run setblock ~ ~ ~ iron_door[open=true,facing=north,hinge=left,half=lower] destroy
#execute in minecraft:overworld as @e[tag=DD_portal_p,tag=DD_open] at @s run setblock ~ ~1 ~ iron_door[open=true,facing=north,hinge=left,half=upper] replace

#close
#execute in minecraft:overworld as @e[tag=DD_portal_p,tag=DD_close] at @s if block ~ ~ ~ minecraft:iron_door[open=true,facing=north,hinge=left] run setblock ~ ~ ~ iron_door[open=false,facing=north,hinge=left,half=lower] destroy
#execute in minecraft:overworld as @e[tag=DD_portal_p,tag=DD_close] at @s run setblock ~ ~1 ~ iron_door[open=false,facing=north,hinge=left,half=upper] replace

#kill door
#execute in minecraft:overworld as @e[tag=DD_portal_p,tag=DD_open] at @s run kill @e[type=minecraft:item,name="Iron Door",limit=1,sort=nearest,nbt={Age:0s}]
#execute in minecraft:overworld as @e[tag=DD_portal_p,tag=DD_close] at @s run kill @e[type=minecraft:item,name="Iron Door",limit=1,sort=nearest,nbt={Age:0s}]


# door removal

#tag destroy
execute in minecraft:overworld as @e[tag=DD_portal] at @s unless block ~ ~ ~ minecraft:oak_door run tag @s add DD_destroy

#remove loaders
execute in minecraft:overworld as @e[tag=DD_destroy] at @s run forceload remove ~ ~

#hard check if it's supposed to be loaded
execute in minecraft:overworld as @e[tag=DD_destroy] at @s at @e[tag=DD_portal,tag=!DD_destroy,distance=..32] run forceload add ~ ~

#blow up all with same ID
execute in minecraft:overworld as @e[tag=DD_portal] at @s align xyz if score @s DD_doorID = @e[tag=DD_destroy,distance=0.5..,limit=1] DD_doorID run summon minecraft:fireball ~0.5 ~0.5 ~0.5 {Motion:[0.0,-10.0,0.0],ExplosionPower:2,ExplosionRadius:2}

#kill tag
execute in minecraft:overworld as @e[tag=DD_destroy] run kill @s


#> limbo
#todo
#create iron door portal
#iron door can only be opened by player proximity

#create limbo chunk
#execute in minecraft:the_nether as @e[tag=DD_createPocket] at @s run fill ~ ~ ~ ~16 ~16 ~16 minecraft:black_concrete outline
#execute in minecraft:the_nether as @e[tag=DD_createPocket] at @s run fill ~1 ~1 ~1 ~15 ~15 ~15 minecraft:barrier outline
#execute in minecraft:the_nether as @e[tag=DD_createPocket] at @s run tp @s ~8 ~2 ~8

#clear cache asap
#execute in minecraft:the_nether as @e[tag=DD_createPocket] run tag @s remove DD_createPocket


# clear cache

#if tag, remove tag
execute in minecraft:overworld as @e[tag=DD_enter] run tag @s remove DD_enter
execute in minecraft:overworld as @e[tag=DD_enter+] run tag @s remove DD_enter+
execute in minecraft:overworld as @e[tag=DD_enter-] run tag @s remove DD_enter-
execute in minecraft:overworld as @e[tag=DD_door404] run tag @s remove DD_door404
execute in minecraft:overworld as @e[tag=DD_open] run tag @s remove DD_open
execute in minecraft:overworld as @e[tag=DD_close] run tag @s remove DD_close


gamerule commandBlockOutput true
