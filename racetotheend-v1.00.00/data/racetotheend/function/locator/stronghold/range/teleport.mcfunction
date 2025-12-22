$execute as @n[tag=RE_locator_caster] at @s run tp @s ^ ^ ^$(distance)
$scoreboard players remove VAR$ticker RE_locator $(distance)

execute if score VAR$ticker RE_locator matches 1000.. run return run function racetotheend:locator/stronghold/range/teleport {distance:1000}
execute if score VAR$ticker RE_locator matches 100.. run return run function racetotheend:locator/stronghold/range/teleport {distance:100}
execute if score VAR$ticker RE_locator matches 10.. run return run function racetotheend:locator/stronghold/range/teleport {distance:10}
execute if score VAR$ticker RE_locator matches 1.. run return run function racetotheend:locator/stronghold/range/teleport {distance:1}

schedule function racetotheend:locator/stronghold/precise/start 1t