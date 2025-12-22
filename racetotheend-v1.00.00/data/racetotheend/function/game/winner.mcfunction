# Calculate time for split
execute store result storage racetotheend:temp announcer.input int 1 run scoreboard players get @s RE_KillDragon
function racetotheend:_packages/conversion/tickstotime {input_storage:"racetotheend:temp", input_path:"announcer.input", output_storage:"racetotheend:temp", output_path:"announcer"}

# Congratulations! touchportyl killed the Ender Dragon! Winning the game with a time of 0h 0m 0s 00t!
tellraw @a [{"text":"\n ","color":"white"},{"text":"Congratulations! ","color":"green"},{"selector":"@s","color":"gold"},{"text":" killed the Ender Dragon! Winning the game with a time of "},{"nbt":"announcer.hours","storage":"racetotheend:temp"},{"text":"h "},{"nbt":"announcer.minutesZero","storage":"racetotheend:temp"},{"nbt":"announcer.minutes","storage":"racetotheend:temp"},{"text":"m "},{"nbt":"announcer.secondsZero","storage":"racetotheend:temp"},{"nbt":"announcer.seconds","storage":"racetotheend:temp"},{"text":"s "},{"nbt":"announcer.ticksZero","storage":"racetotheend:temp","color":"gray"},{"nbt":"announcer.ticks","storage":"racetotheend:temp","color":"gray"},{"text":"t","color":"gray"},{"text":"!"}]

# Cleanup
data remove storage racetotheend:temp announcer

# End the game
function racetotheend:game/stop

# Calculate stats
function racetotheend:stats/display

# Create the podium
function racetotheend:game/podium/create

# tp all players to the podium, spread them out, and force them to look at the first place mannequin

# start playing victory music and effects
execute at @n[tag=RE_podium] run playsound minecraft:music_disc.relic master @a ~ ~ ~ 1 1 1