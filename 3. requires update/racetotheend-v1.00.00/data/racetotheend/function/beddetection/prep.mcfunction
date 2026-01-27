# prepares the bed detection system in the end
# this happens once when the first player enters the end
execute in minecraft:the_end positioned 0 100 0 run summon minecraft:marker ~ ~ ~ {Tags:["RaceToTheEnd","RE_bed_marker"]}
function racetotheend:beddetection/yfinder/tick