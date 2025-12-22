# spawn probe marker
execute as @n[tag=RE_locator_caster] at @s align xyz run summon minecraft:marker ~ ~ ~ {Tags:["RaceToTheEnd","RE_probe"]}

# start recursion
function racetotheend:locator/stronghold/precise/probe