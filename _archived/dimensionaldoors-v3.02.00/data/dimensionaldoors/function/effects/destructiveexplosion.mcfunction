# break the door
execute if block ~ ~ ~ #minecraft:doors run setblock ~ ~ ~ minecraft:air replace
execute if block ~ ~1 ~ #minecraft:doors run setblock ~ ~1 ~ minecraft:air replace

# 1.14 - 1.15
execute if score VERSION$minecraft.current DatapackManager matches 14..15 run summon minecraft:fireball ~ ~ ~ {direction:[0.0,-10.0,0.0],ExplosionPower:2,Fire:20}

# 1.16 ++
execute if score VERSION$minecraft.current DatapackManager matches 16.. run summon minecraft:fireball ~ ~ ~ {Motion:[0.0,-10.0,0.0],ExplosionPower:2,Invulnerable:1}