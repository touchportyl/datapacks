# process results
function racetotheend:locator/stronghold/process

# display score if accurate
execute if score VAR$distance.error RE_locator matches 0..1 run function racetotheend:locator/stronghold/display

# return player to cast location
tp @n[tag=RE_locator_caster] @n[tag=RE_cast_location]

# restore old gamemode
execute as @n[tag=RE_locator_caster,tag=RE_old_gamemode_survival] run gamemode survival @s
execute as @n[tag=RE_locator_caster,tag=RE_old_gamemode_creative] run gamemode creative @s
execute as @n[tag=RE_locator_caster,tag=RE_old_gamemode_spectator] run gamemode spectator @s
execute as @n[tag=RE_locator_caster,tag=RE_old_gamemode_adventure] run gamemode adventure @s

# cleanup
function racetotheend:locator/stronghold/cleanup