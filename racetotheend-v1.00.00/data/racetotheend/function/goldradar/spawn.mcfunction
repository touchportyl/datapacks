execute if entity @e[tag=RaceToTheEnd,tag=RE_goldradar,distance=..1] run return fail

summon minecraft:shulker ~ ~ ~ {Health:1,Glowing:1b,Invulnerable:1b,NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,Tags:["RaceToTheEnd","RE_goldradar","RE_new"],attributes:[{id:max_health,base:1f}]}

effect give @n[tag=RE_goldradar,tag=RE_new] minecraft:invisibility infinite 0 true

tag @e[tag=RE_goldradar,tag=RE_new] remove RE_new