# enable config triggers
scoreboard players enable @s z_pt_001_t
scoreboard players enable @s z_pt_001_f
execute if score VERSION$minecraft.current.minor DatapackManager matches 17.. run scoreboard players enable @s z_pt_002_t
execute if score VERSION$minecraft.current.minor DatapackManager matches 17.. run scoreboard players enable @s z_pt_002_f