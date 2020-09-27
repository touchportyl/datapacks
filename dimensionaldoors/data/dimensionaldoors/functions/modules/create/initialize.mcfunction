#> -----------------------------------------------
#> Dimensional Doors Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> init
# this creates an entrance with tags based on the door the conduit is in

say init
# remove generator item
kill @e[tag=DD_generator,distance=..1,limit=1]

# forceload chunk
forceload add ~ ~


# create linking conduit
execute if entity @s[tag=DD_entrance] run summon minecraft:item ^ ^ ^1 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:conduit",Count:1,tag:{DD_Linked:1b,display:{Name:'{"text":"Entangled Conduit","color":"light_purple","italic":"false"}',Lore:['','{"text":"This conduit\'s quantum state","color":"gray","italic":"false"}','{"text":"is entangled to a dimensional","color":"gray","italic":"false"}','{"text":"door","color":"gray","italic":"false"}','{"text":" "}','{"text":"Quantum state: ","color":"dark_gray","italic":"false","extra":[{"text":"entangled","color":"dark_gray","obfuscated":"true"}]}']}}},Tags:["DimensionalDoors","DD_generateLink","DD_particleLink"],PickupDelay:40}

# tag linking conduit with door id
execute as @e[tag=DD_generateLink] store result entity @s Item.tag.DD_doorID int 1 run scoreboard players get $d.doorID.current DD_doorID
execute as @e[tag=DD_generateLink] at @s run tag @s remove DD_generateLink


# grant advancement
advancement grant @a[distance=..7] only dimensionaldoors:adventure/create_door

# remove tag
tag @s remove DD_new


#> End of file
#> -----------
