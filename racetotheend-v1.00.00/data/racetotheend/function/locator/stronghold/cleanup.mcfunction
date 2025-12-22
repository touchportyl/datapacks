schedule clear function racetotheend:locator/stronghold/range/tick
schedule clear function racetotheend:locator/stronghold/range/process
schedule clear function racetotheend:locator/stronghold/precise/probe

tag @a[tag=RE_locator_caster] remove RE_locator_caster
execute at @n[tag=RE_cast_location] run forceload remove ~ ~
kill @n[tag=RE_probe]
kill @n[tag=RE_cast_location]

scoreboard objectives remove RE_locator