# effects

# compatibility

# 1.14 - 1.15
execute if score VERSION$minecraft.current DatapackManager matches 14..15 run summon minecraft:fireball ~ ~ ~ {direction:[0.0,-10.0,0.0],ExplosionPower:2,Fire:20}

# 1.16 - 1.20
execute if score VERSION$minecraft.current DatapackManager matches 16..20 run summon minecraft:fireball ~ ~ ~ {Motion:[0.0,-10.0,0.0],ExplosionPower:2,Invulnerable:1}

# no fallback