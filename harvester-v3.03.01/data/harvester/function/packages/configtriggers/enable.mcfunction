# enable config triggers
scoreboard players enable @s z_hv_001_t
scoreboard players enable @s z_hv_001_f
scoreboard players enable @s z_hv_002_t
scoreboard players enable @s z_hv_002_f
execute if score VERSION$minecraft.current.minor matches 17.. run scoreboard players enable @s z_hv_003_t
execute if score VERSION$minecraft.current.minor matches 17.. run scoreboard players enable @s z_hv_003_f