# This function is overloaded to also show locator distances
# there is 4 variants of this function:
# - timer only
# - timer only (end)
# - timer + stronghold (overworld)
# - timer + bastion + fortress
# - timer + bastion + fortress + stronghold (nether)

$title @s[team=RE_Overworld,tag=!RE_stronghold_found,advancements={racetotheend:splits/stronghold=false}] actionbar [{"text":"$(hours)h $(minutesZero)$(minutes)m $(secondsZero)$(seconds)s ","color":"white"},{"text":"$(ticksZero)$(ticks)t","color":"gray"}]

$title @s[team=RE_End] actionbar [{"text":"$(hours)h $(minutesZero)$(minutes)m $(secondsZero)$(seconds)s ","color":"white"},{"text":"$(ticksZero)$(ticks)t","color":"gray"}]

$title @s[team=RE_Overworld,tag=RE_stronghold_found,advancements={racetotheend:splits/stronghold=true}] actionbar [{"text":"$(hours)h $(minutesZero)$(minutes)m $(secondsZero)$(seconds)s ","color":"white"},{"text":"$(ticksZero)$(ticks)t","color":"gray"},{"text":" [","color":"gray"},{"score":{"name":"@s","objective":"RE_sh_o_x"},"color":"light_purple"},{"text":", ","color":"gray"},{"score":{"name":"@s","objective":"RE_sh_o_y"},"color":"light_purple"},{"text":", ","color":"gray"},{"score":{"name":"@s","objective":"RE_sh_o_z"},"color":"light_purple"},{"text":"]","color":"gray"},{"text":" (","color":"gray"},{"score":{"name":"@s","objective":"RE_sh_o_d"},"color":"light_purple"},{"text":")","color":"gray"}]

$title @s[team=RE_Nether,tag=!RE_stronghold_found,advancements={racetotheend:splits/stronghold=false}] actionbar [{"text":"$(hours)h $(minutesZero)$(minutes)m $(secondsZero)$(seconds)s ","color":"white"},{"text":"$(ticksZero)$(ticks)t","color":"gray"},{"text":" [","color":"gray"},{"score":{"name":"@s","objective":"RE_bastiondist"},"color":"gold"},{"text":"]","color":"gray"},{"text":" [","color":"gray"},{"score":{"name":"@s","objective":"RE_fortressdist"},"color":"red"},{"text":"]","color":"gray"}]

$title @s[team=RE_Nether,tag=RE_stronghold_found,advancements={racetotheend:splits/stronghold=true}] actionbar [{"text":"$(hours)h $(minutesZero)$(minutes)m $(secondsZero)$(seconds)s ","color":"white"},{"text":"$(ticksZero)$(ticks)t","color":"gray"},{"text":" [","color":"gray"},{"score":{"name":"@s","objective":"RE_bastiondist"},"color":"gold"},{"text":"]","color":"gray"},{"text":" [","color":"gray"},{"score":{"name":"@s","objective":"RE_fortressdist"},"color":"red"},{"text":"]","color":"gray"},{"text":" [","color":"gray"},{"score":{"name":"@s","objective":"RE_sh_n_x"},"color":"light_purple"},{"text":", ","color":"gray"},{"score":{"name":"@s","objective":"RE_sh_n_y"},"color":"light_purple"},{"text":", ","color":"gray"},{"score":{"name":"@s","objective":"RE_sh_n_z"},"color":"light_purple"},{"text":"]","color":"gray"},{"text":" (","color":"gray"},{"score":{"name":"@s","objective":"RE_sh_n_d"},"color":"light_purple"},{"text":")","color":"gray"}]