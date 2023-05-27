tag @s add portyltrident
tag @s add PT_thrown

data modify entity @s NoGravity set value 1b

# start ambient ticker
schedule function portyltrident:core/execute/trident/ambient 1t