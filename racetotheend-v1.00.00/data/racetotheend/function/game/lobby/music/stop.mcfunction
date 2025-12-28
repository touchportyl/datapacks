execute if score VAR$lobby.music.playing RaceToTheEnd = BOOL$false RaceToTheEnd run return fail

stopsound @a[tag=RE_in_lobby] record
scoreboard players operation VAR$lobby.music.playing RaceToTheEnd = BOOL$false RaceToTheEnd
schedule clear racetotheend:game/lobby/music/particles
schedule clear racetotheend:game/lobby/music/next

data modify entity @n[tag=RE_lobby_jukebox_text_display1] text set value [{"text":"♫ JukeBox by touchportyl ♫"}]
data modify entity @n[tag=RE_lobby_jukebox_text_display2] text set value [{"text":"Not playing."}]