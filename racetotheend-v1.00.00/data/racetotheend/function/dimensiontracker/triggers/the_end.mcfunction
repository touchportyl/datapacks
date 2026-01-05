advancement revoke @s only racetotheend:dimensiontracker/the_end

team join RE_End @s
function racetotheend:locator/updatebossbarplayers

execute unless entity @n[tag=RE_bed_marker] run schedule function racetotheend:beddetection/prep 100t