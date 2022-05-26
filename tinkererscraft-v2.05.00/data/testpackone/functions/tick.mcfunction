tellraw @a[tag=!testpackone] [{"text":"testpackone -> [ tick.mcfunction ]","color":"gray"}]

tag @a add testpackone
bossbar set testpackone name [{"text":"Test Pack One - Ticking"}]
bossbar set testpackone value 2


execute as @a at @s run function testpackone:light


schedule function testpackone:tick 1t