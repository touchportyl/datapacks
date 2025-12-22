# sample distance

execute at @n[tag=RE_probe] store result score VAR$distance.c RE_locator run locate structure minecraft:stronghold

# distance check
execute if score VAR$distance.c RE_locator matches 0 at @n[tag=RE_probe] run return run function racetotheend:locator/stronghold/finish
execute if score VAR$distance.c RE_locator matches ..8 at @n[tag=RE_probe] run return run function racetotheend:locator/stronghold/precise/probe_ {distance:1}
execute if score VAR$distance.c RE_locator matches ..32 at @n[tag=RE_probe] run return run function racetotheend:locator/stronghold/precise/probe_ {distance:4}
execute if score VAR$distance.c RE_locator matches ..256 at @n[tag=RE_probe] run return run function racetotheend:locator/stronghold/precise/probe_ {distance:16}
execute if score VAR$distance.c RE_locator matches 257.. run return run function racetotheend:locator/stronghold/finish

# debug
#tellraw @a[tag=RE_locator_caster] [{"text":"Probe Distance: ","color":"gray"},{"score":{"name":"VAR$distance.c","objective":"RE_locator"},"color":"green"}]

# recurse
execute if score VAR$distance.c RE_locator matches ..256 run function racetotheend:locator/stronghold/precise/probe