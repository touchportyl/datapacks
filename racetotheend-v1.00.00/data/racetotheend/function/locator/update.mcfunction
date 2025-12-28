# update bossbar values
execute as @a[team=RE_Nether] at @s run function racetotheend:locator/bastion/update
execute as @a[team=RE_Nether] at @s run function racetotheend:locator/fortress/update
execute as @a[team=!RE_End,advancements={racetotheend:splits/stronghold=true}] at @s run function racetotheend:locator/stronghold/bossbar/update

# loop
schedule function racetotheend:locator/update 4t