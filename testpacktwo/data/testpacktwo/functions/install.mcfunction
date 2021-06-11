tellraw @a [{"text":"testpacktwo -> [ install.mcfunction ]","color":"gray"}]

tag @a remove testpacktwo

bossbar add testpacktwo [{"text":"Test Pack Two"}]
bossbar set testpacktwo name [{"text":"Test Pack Two - Installing"}]
bossbar set testpacktwo visible true
bossbar set testpacktwo color white
bossbar set testpacktwo style progress
bossbar set testpacktwo max 2
bossbar set testpacktwo value 1
bossbar set testpacktwo players @a

schedule function testpacktwo:tick 1s