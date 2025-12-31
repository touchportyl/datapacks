# update bossbar values
execute as @a[team=RE_Nether] at @s run function racetotheend:locator/bastion/update
execute as @a[team=RE_Nether] at @s run function racetotheend:locator/fortress/update
execute as @a[team=!RE_End,advancements={racetotheend:splits/stronghold=true}] at @s run function racetotheend:locator/stronghold/bossbar/update

# silverfish ping to assist players in locating end portal
execute as @a[team=!RE_End,advancements={racetotheend:splits/stronghold=true}] at @s run effect give @e[type=minecraft:silverfish,distance=..32] minecraft:glowing 1 0 true


# loop
schedule function racetotheend:locator/update 4t