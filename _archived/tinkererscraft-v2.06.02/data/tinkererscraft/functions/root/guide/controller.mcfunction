# controls the guide book's display direction


execute if entity @a[distance=..16,sort=nearest,limit=1] run function tinkererscraft:root/guide/facing/all

execute if entity @a[y_rotation=135..225,distance=..16,sort=nearest,limit=1] run function tinkererscraft:root/guide/facing/north

execute if entity @a[y_rotation=225..315,distance=..16,sort=nearest,limit=1] run function tinkererscraft:root/guide/facing/east

execute if entity @a[y_rotation=315..45,distance=..16,sort=nearest,limit=1] run function tinkererscraft:root/guide/facing/south

execute if entity @a[y_rotation=45..135,distance=..16,sort=nearest,limit=1] run function tinkererscraft:root/guide/facing/west