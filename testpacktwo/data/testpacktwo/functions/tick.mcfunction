tellraw @a[tag=!testpacktwo] [{"text":"testpacktwo -> [ tick.mcfunction ]","color":"gray"}]

tag @a add testpacktwo
bossbar set testpacktwo name [{"text":"Test Pack Two - Ticking"}]
bossbar set testpacktwo value 2


schedule function testpacktwo:tick 1t