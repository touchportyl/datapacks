tag @s[name="/redstone lamp create"] add ESF_processed
execute as @s[name="/redstone lamp create",tag=ESF_processed] at @s run function endermitescriptframework:scripts/blinkingredstonelamp/create

tag @s[name="/redstone lamp destroy"] add ESF_processed
execute as @s[name="/redstone lamp destroy",tag=ESF_processed] at @s run function endermitescriptframework:scripts/blinkingredstonelamp/destroy
  
tag @s[name="/redstone lamp reveal"] add ESF_processed
execute as @s[name="/redstone lamp reveal",tag=ESF_processed] at @s run function endermitescriptframework:scripts/blinkingredstonelamp/reveal