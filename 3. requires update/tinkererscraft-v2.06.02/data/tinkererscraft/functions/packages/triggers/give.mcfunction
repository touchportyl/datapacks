# handles the give trigger


# trigger
execute as @a[scores={TC_Give=1}] run function tinkererscraft:root/guide/book


# reset
scoreboard players reset @a[scores={TC_Give=1..}] TC_Give