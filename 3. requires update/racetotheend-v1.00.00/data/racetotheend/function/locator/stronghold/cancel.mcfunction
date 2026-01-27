# cancels the throw and refunds the eye
tellraw @s [{"text":"The stronghold locator is being used by another player! Wait a few seconds before trying again.","color":"red"}]
function racetotheend:_packages/effects/alert
execute at @s run kill @n[type=minecraft:eye_of_ender,distance=..1]
give @s minecraft:ender_eye 1