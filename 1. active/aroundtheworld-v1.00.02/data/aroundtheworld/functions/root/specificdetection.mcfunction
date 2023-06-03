

# bounds
# min.x  -6400
# max.x   2400
# min.z  -1900
# max.z   2900

# north [-z]
execute as @a at @s if entity @s[z=-1900,dz=-100] run tp @s ~ ~ 2850

# south [z]
execute as @a at @s if entity @s[z=2900,dz=100] run tp @s ~ ~ -1850

# east [x]
execute as @a at @s if entity @s[x=-6400,dx=-100] run tp @s ~ ~ 2350

# west [-x]
execute as @a at @s if entity @s[x=2400,dx=100] run tp @s ~ ~ -6350