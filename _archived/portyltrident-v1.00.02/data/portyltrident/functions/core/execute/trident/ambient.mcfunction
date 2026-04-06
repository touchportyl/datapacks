# run once on throw
execute as @e[tag=PT_thrown] at @s run function portyltrident:effects/throw


# ambient effects during flight
execute as @e[tag=portyltrident] at @s run function portyltrident:effects/ambient

execute as @e[tag=portyltrident] at @s run function portyltrident:core/execute/trident/kill


# remove
scoreboard players add @e[tag=portyltrident] PortylTrident 1
kill @e[tag=portyltrident,scores={PortylTrident=400..}]


# check for hit
execute as @e[tag=portyltrident,nbt={inGround:1b}] at @s run function portyltrident:core/execute/trident/onhit


# loop
schedule function portyltrident:core/execute/trident/ambient 1t