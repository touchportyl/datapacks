tellraw @a[tag=debug] [{"text":"> spawnlinkedconduit-3.00.00.mcfunction","color":"gray"}]

summon minecraft:item ^ ^ ^1 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:conduit",Count:1,tag:{DD_Linked:1b,display:{Name:'{"text":"Entangled Conduit","color":"light_purple","italic":"false"}',Lore:['','{"text":"This conduit\'s quantum state","color":"gray","italic":"false"}','{"text":"is entangled to a dimensional","color":"gray","italic":"false"}','{"text":"door","color":"gray","italic":"false"}','{"text":" "}','{"text":"Quantum state: ","color":"dark_gray","italic":"false","extra":[{"text":"entangled","color":"dark_gray","obfuscated":"true"}]}']}}},Tags:["DimensionalDoors","DD_generateLink","DD_particleLink"],PickupDelay:40}

execute as @e[tag=DD_generateLink] store result entity @s Item.tag.DD_doorID int 1 run scoreboard players get DD$doorID.current DD_doorID

execute as @e[tag=DD_generateLink] run tag @s remove DD_generateLink
