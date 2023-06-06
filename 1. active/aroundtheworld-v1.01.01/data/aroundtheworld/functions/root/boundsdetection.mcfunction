# if player is in bounds, ignore

# bounds
# min.x  -6400
# max.x   2400
# min.z  -1900
# max.z   2900

# if player is moving out of bounds, start detecting
execute as @a at @s unless entity @s[x=-6400,z=-1900,dx=8800,dz=4800] run function aroundtheworld:root/specificdetection