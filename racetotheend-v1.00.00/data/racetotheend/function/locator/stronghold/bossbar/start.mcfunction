#bossbar add racetotheend:locator/stronghold stronghold

#bossbar set racetotheend:locator/stronghold value 0
#bossbar set racetotheend:locator/stronghold max 1
#bossbar set racetotheend:locator/stronghold color purple
#bossbar set racetotheend:locator/stronghold style progress

#bossbar add racetotheend:locator/stronghold_nether stronghold_nether

#bossbar set racetotheend:locator/stronghold_nether value 0
#bossbar set racetotheend:locator/stronghold_nether max 1
#bossbar set racetotheend:locator/stronghold_nether color purple
#bossbar set racetotheend:locator/stronghold_nether style progress

scoreboard objectives add RE_sh_o_x dummy [{"text":"Race to the End: Stronghold Overworld X"}]
scoreboard objectives add RE_sh_o_y dummy [{"text":"Race to the End: Stronghold Overworld Y"}]
scoreboard objectives add RE_sh_o_z dummy [{"text":"Race to the End: Stronghold Overworld Z"}]
scoreboard objectives add RE_sh_o_d dummy [{"text":"Race to the End: Stronghold Overworld Distance"}]
scoreboard objectives add RE_sh_n_x dummy [{"text":"Race to the End: Stronghold Nether X"}]
scoreboard objectives add RE_sh_n_y dummy [{"text":"Race to the End: Stronghold Nether Y"}]
scoreboard objectives add RE_sh_n_z dummy [{"text":"Race to the End: Stronghold Nether Z"}]
scoreboard objectives add RE_sh_n_d dummy [{"text":"Race to the End: Stronghold Nether Distance"}]