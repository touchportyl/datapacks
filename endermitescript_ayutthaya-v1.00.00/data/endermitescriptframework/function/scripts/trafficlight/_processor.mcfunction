tag @s[name="/traffic light create"] add ESF_processed
execute as @s[name="/traffic light create",tag=ESF_processed] at @s run function endermitescriptframework:scripts/trafficlight/create

tag @s[name="/traffic light create x"] add ESF_processed
execute as @s[name="/traffic light create x",tag=ESF_processed] at @s run function endermitescriptframework:scripts/trafficlight/create_x

tag @s[name="/traffic light create x alt"] add ESF_processed
execute as @s[name="/traffic light create x alt",tag=ESF_processed] at @s run function endermitescriptframework:scripts/trafficlight/create_x_alt

tag @s[name="/traffic light destroy"] add ESF_processed
execute as @s[name="/traffic light destroy",tag=ESF_processed] at @s run function endermitescriptframework:scripts/trafficlight/destroy
  
tag @s[name="/traffic light reveal"] add ESF_processed
execute as @s[name="/traffic light reveal",tag=ESF_processed] at @s run function endermitescriptframework:scripts/trafficlight/reveal