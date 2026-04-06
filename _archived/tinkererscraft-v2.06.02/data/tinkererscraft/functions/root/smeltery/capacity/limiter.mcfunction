# enforce the storage limit


# individual limiter checks
execute if score @s TC_lIron > @s TC_lCapacity run function tinkererscraft:root/smeltery/capacity/iron
execute if score @s TC_lGold > @s TC_lCapacity run function tinkererscraft:root/smeltery/capacity/gold
execute if score @s TC_lObsidian > @s TC_lCapacity run function tinkererscraft:root/smeltery/capacity/obsidian
execute if score @s TC_lIrgol > @s TC_lCapacity run function tinkererscraft:root/smeltery/capacity/irgol
execute if score @s TC_lObdiam > @s TC_lCapacity run function tinkererscraft:root/smeltery/capacity/obdiam


# advancement for max iron
execute as @s[scores={TC_lIron=4096}] at @s run advancement grant @a[distance=..7,sort=nearest] only tinkererscraft:smeltery/capacity/iron

# advancement for max gold
execute as @s[scores={TC_lGold=4096}] at @s run advancement grant @a[distance=..7,sort=nearest] only tinkererscraft:smeltery/capacity/gold

# advancement for max obsidian
execute as @s[scores={TC_lObsidian=4096}] at @s run advancement grant @a[distance=..7,sort=nearest] only tinkererscraft:smeltery/capacity/obsidian

# advancement for max irgol
execute as @s[scores={TC_lIrgol=4096}] at @s run advancement grant @a[distance=..7,sort=nearest] only tinkererscraft:smeltery/capacity/irgol

# advancement for max obdiam
execute as @s[scores={TC_lObdiam=4096}] at @s run advancement grant @a[distance=..7,sort=nearest] only tinkererscraft:smeltery/capacity/obdiam


# advancement on max capacity
execute as @s[scores={TC_lIron=4096,TC_lGold=4096,TC_lObsidian=4096,TC_lIrgol=4096,TC_lObdiam=4096}] at @s run advancement grant @a[distance=..7,sort=nearest] only tinkererscraft:smeltery/capacity/max