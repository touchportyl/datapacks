tag @s add PortylTrident
tag @s add PT_thrown

data modify entity @s NoGravity set value 1b

# start ambient ticker
schedule function portyltrident:root/trident/ambient 1t