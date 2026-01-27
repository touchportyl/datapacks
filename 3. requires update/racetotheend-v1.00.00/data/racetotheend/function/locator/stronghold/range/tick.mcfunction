execute if entity @n[tag=RE_eye_stop] run return fail

tp @n[tag=RE_locator_caster] @n[tag=RE_cast_location]
execute as @n[tag=RE_locator_caster] at @s run tp @s ~ ~ ~ facing entity @n[tag=RE_eye]
execute as @n[tag=RE_locator_caster] at @s run tp @s ~ ~ ~ ~ ~4.8

execute if entity @n[tag=RE_eye] run return run schedule function racetotheend:locator/stronghold/range/tick 1t