# gold radar ping in the nether
execute in minecraft:the_nether positioned 0 0 0 if entity @r[distance=0..] run function racetotheend:goldradar/ping

schedule function racetotheend:goldradar/update 3t