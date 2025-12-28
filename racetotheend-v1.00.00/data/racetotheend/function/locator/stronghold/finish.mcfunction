# process results
function racetotheend:locator/stronghold/process

execute as @n[tag=RE_locator_caster] at @s run function racetotheend:locator/stronghold/bossbar/set

# display score if accurate
#execute if score VAR$distance.error RE_locator matches 0..1 run function racetotheend:locator/stronghold/display
execute if score VAR$distance.error RE_locator matches 0..1 as @n[tag=RE_locator_caster] run function racetotheend:locator/stronghold/bossbar/update

# return player to cast location
tp @n[tag=RE_locator_caster] @n[tag=RE_cast_location]

# restore old gamemode
execute as @n[tag=RE_locator_caster,tag=RE_old_gamemode_survival] run gamemode survival @s
execute as @n[tag=RE_locator_caster,tag=RE_old_gamemode_creative] run gamemode creative @s
execute as @n[tag=RE_locator_caster,tag=RE_old_gamemode_spectator] run gamemode spectator @s
execute as @n[tag=RE_locator_caster,tag=RE_old_gamemode_adventure] run gamemode adventure @s

# cleanup
function racetotheend:locator/stronghold/cleanup