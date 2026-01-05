# Prepare leading zeros for minutes, seconds, and ticks
execute if score TIMER$minutes RaceToTheEnd matches 0..9 run data modify storage racetotheend:temp timer.minutesZero set value "0"
execute unless score TIMER$minutes RaceToTheEnd matches 0..9 run data modify storage racetotheend:temp timer.minutesZero set value ""
execute if score TIMER$seconds RaceToTheEnd matches 0..9 run data modify storage racetotheend:temp timer.secondsZero set value "0"
execute unless score TIMER$seconds RaceToTheEnd matches 0..9 run data modify storage racetotheend:temp timer.secondsZero set value ""
execute if score TIMER$ticks RaceToTheEnd matches 0..9 run data modify storage racetotheend:temp timer.ticksZero set value "0"
execute unless score TIMER$ticks RaceToTheEnd matches 0..9 run data modify storage racetotheend:temp timer.ticksZero set value ""

# Display actionbar timer
# this function is overloaded to also show locator distances
# there is 4 variants of this function:
# - timer only
# - timer only (end)
# - timer + stronghold (overworld)
# - timer + bastion + fortress
# - timer + bastion + fortress + stronghold (nether)

title @s[team=RE_Overworld,tag=!RE_stronghold_found,advancements={racetotheend:splits/stronghold=false}] actionbar [{"score":{"name":"TIMER$hours","objective":"RaceToTheEnd"}},{"text":"h "},{"nbt":"timer.minutesZero","storage":"racetotheend:temp"},{"score":{"name":"TIMER$minutes","objective":"RaceToTheEnd"}},{"text":"m "},{"nbt":"timer.secondsZero","storage":"racetotheend:temp"},{"score":{"name":"TIMER$seconds","objective":"RaceToTheEnd"}},{"text":"s "},{"nbt":"timer.ticksZero","storage":"racetotheend:temp","color":"gray"},{"score":{"name":"TIMER$ticks","objective":"RaceToTheEnd"},"color":"gray"},{"text":"t"}]

title @s[team=RE_End] actionbar [{"score":{"name":"TIMER$hours","objective":"RaceToTheEnd"}},{"text":"h "},{"nbt":"timer.minutesZero","storage":"racetotheend:temp"},{"score":{"name":"TIMER$minutes","objective":"RaceToTheEnd"}},{"text":"m "},{"nbt":"timer.secondsZero","storage":"racetotheend:temp"},{"score":{"name":"TIMER$seconds","objective":"RaceToTheEnd"}},{"text":"s "},{"nbt":"timer.ticksZero","storage":"racetotheend:temp","color":"gray"},{"score":{"name":"TIMER$ticks","objective":"RaceToTheEnd"},"color":"gray"},{"text":"t"}]

title @s[team=RE_Overworld,tag=RE_stronghold_found,advancements={racetotheend:splits/stronghold=true}] actionbar [{"score":{"name":"TIMER$hours","objective":"RaceToTheEnd"}},{"text":"h "},{"nbt":"timer.minutesZero","storage":"racetotheend:temp"},{"score":{"name":"TIMER$minutes","objective":"RaceToTheEnd"}},{"text":"m "},{"nbt":"timer.secondsZero","storage":"racetotheend:temp"},{"score":{"name":"TIMER$seconds","objective":"RaceToTheEnd"}},{"text":"s "},{"nbt":"timer.ticksZero","storage":"racetotheend:temp","color":"gray"},{"score":{"name":"TIMER$ticks","objective":"RaceToTheEnd"},"color":"gray"},{"text":"t"},{"text":" [","color":"gray"},{"score":{"name":"@s","objective":"RE_sh_o_x"},"color":"light_purple"},{"text":", ","color":"gray"},{"score":{"name":"@s","objective":"RE_sh_o_y"},"color":"light_purple"},{"text":", ","color":"gray"},{"score":{"name":"@s","objective":"RE_sh_o_z"},"color":"light_purple"},{"text":"]","color":"gray"},{"text":" (","color":"gray"},{"score":{"name":"@s","objective":"RE_sh_o_d"},"color":"light_purple"},{"text":")","color":"gray"}]

title @s[team=RE_Nether,tag=!RE_stronghold_found,advancements={racetotheend:splits/stronghold=false}] actionbar [{"score":{"name":"TIMER$hours","objective":"RaceToTheEnd"}},{"text":"h "},{"nbt":"timer.minutesZero","storage":"racetotheend:temp"},{"score":{"name":"TIMER$minutes","objective":"RaceToTheEnd"}},{"text":"m "},{"nbt":"timer.secondsZero","storage":"racetotheend:temp"},{"score":{"name":"TIMER$seconds","objective":"RaceToTheEnd"}},{"text":"s "},{"nbt":"timer.ticksZero","storage":"racetotheend:temp","color":"gray"},{"score":{"name":"TIMER$ticks","objective":"RaceToTheEnd"},"color":"gray"},{"text":"t","color":"gray"},{"text":" [","color":"gray"},{"score":{"name":"@s","objective":"RE_bastiondist"},"color":"gold"},{"text":"]","color":"gray"},{"text":" [","color":"gray"},{"score":{"name":"@s","objective":"RE_fortressdist"},"color":"red"},{"text":"]","color":"gray"}]

title @s[team=RE_Nether,tag=RE_stronghold_found,advancements={racetotheend:splits/stronghold=true}] actionbar [{"score":{"name":"TIMER$hours","objective":"RaceToTheEnd"}},{"text":"h "},{"nbt":"timer.minutesZero","storage":"racetotheend:temp"},{"score":{"name":"TIMER$minutes","objective":"RaceToTheEnd"}},{"text":"m "},{"nbt":"timer.secondsZero","storage":"racetotheend:temp"},{"score":{"name":"TIMER$seconds","objective":"RaceToTheEnd"}},{"text":"s "},{"nbt":"timer.ticksZero","storage":"racetotheend:temp","color":"gray"},{"score":{"name":"TIMER$ticks","objective":"RaceToTheEnd"},"color":"gray"},{"text":"t","color":"gray"},{"text":" [","color":"gray"},{"score":{"name":"@s","objective":"RE_bastiondist"},"color":"gold"},{"text":"]","color":"gray"},{"text":" [","color":"gray"},{"score":{"name":"@s","objective":"RE_fortressdist"},"color":"red"},{"text":"]","color":"gray"},{"text":" [","color":"gray"},{"score":{"name":"@s","objective":"RE_sh_n_x"},"color":"light_purple"},{"text":", ","color":"gray"},{"score":{"name":"@s","objective":"RE_sh_n_y"},"color":"light_purple"},{"text":", ","color":"gray"},{"score":{"name":"@s","objective":"RE_sh_n_z"},"color":"light_purple"},{"text":"]","color":"gray"},{"text":" (","color":"gray"},{"score":{"name":"@s","objective":"RE_sh_n_d"},"color":"light_purple"},{"text":")","color":"gray"}]


# Cleanup
data remove storage racetotheend:temp timer