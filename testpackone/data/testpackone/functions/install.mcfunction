tellraw @a [{"text":"testpackone -> [ install.mcfunction ]","color":"gray"}]

tag @a remove testpackone

bossbar add testpackone [{"text":"Test Pack One"}]
bossbar set testpackone name [{"text":"Test Pack One - Installing"}]
bossbar set testpackone visible true
bossbar set testpackone color white
bossbar set testpackone style progress
bossbar set testpackone max 2
bossbar set testpackone value 1
bossbar set testpackone players @a

schedule function testpackone:tick 1s