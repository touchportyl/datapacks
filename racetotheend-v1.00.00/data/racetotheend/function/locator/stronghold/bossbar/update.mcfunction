# get distance to stronghold
execute in minecraft:overworld store result score @s RE_sh_o_d run locate structure minecraft:stronghold
scoreboard players operation @s RE_sh_n_d = @s RE_sh_o_d
scoreboard players operation @s RE_sh_n_d /= CONST$nether.scale RaceToTheEnd

# update bossbar
bossbar set racetotheend:locator/stronghold name [{"text":"Stronghold: [","color":"gray"},{"score":{"name":"@s","objective":"RE_sh_o_x"},"color":"light_purple"},{"text":", "},{"score":{"name":"@s","objective":"RE_sh_o_y"},"color":"light_purple"},{"text":", "},{"score":{"name":"@s","objective":"RE_sh_o_z"},"color":"light_purple"},{"text":"] Distance: "},{"score":{"name":"@s","objective":"RE_sh_o_d"},"color":"light_purple"}]

bossbar set racetotheend:locator/stronghold_nether name [{"text":"Stronghold: [","color":"gray"},{"score":{"name":"@s","objective":"RE_sh_n_x"},"color":"light_purple"},{"text":", "},{"score":{"name":"@s","objective":"RE_sh_n_y"},"color":"light_purple"},{"text":", "},{"score":{"name":"@s","objective":"RE_sh_n_z"},"color":"light_purple"},{"text":"] Distance: "},{"score":{"name":"@s","objective":"RE_sh_n_d"},"color":"light_purple"}]