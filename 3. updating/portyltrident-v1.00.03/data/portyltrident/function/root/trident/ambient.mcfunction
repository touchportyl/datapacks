# run once on throw
execute as @e[tag=PT_thrown] at @s run function portyltrident:effects/throw


# ambient effects during flight
execute as @e[tag=PortylTrident] at @s run function portyltrident:effects/ambient

execute as @e[tag=PortylTrident] at @s run function portyltrident:root/trident/kill


# remove
scoreboard players add @e[tag=PortylTrident] PortylTrident 1
kill @e[tag=PortylTrident,scores={PortylTrident=400..}]


# check for hit
execute as @e[tag=PortylTrident,nbt={inGround:1b}] at @s run function portyltrident:root/trident/onhit


# loop
schedule function portyltrident:root/trident/ambient 1t