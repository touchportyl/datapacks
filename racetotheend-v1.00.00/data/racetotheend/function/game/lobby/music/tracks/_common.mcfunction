$execute at @n[tag=RE_lobby_root] positioned ~ ~ ~4 run playsound minecraft:music_disc.$(trackID) record @a[tag=RE_in_lobby] ~ ~ ~ 1 1 0

data modify entity @n[tag=RE_lobby_jukebox_text_display1] text set value [{"text":"♫ Now playing ♫"}]
$data modify entity @n[tag=RE_lobby_jukebox_text_display2] text set value [{"text":"$(trackName)"}]

scoreboard players operation VAR$lobby.music.playing RaceToTheEnd = BOOL$true RaceToTheEnd
$schedule function racetotheend:game/lobby/music/next $(trackDurationInSeconds)s