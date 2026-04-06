# detect all endermites
execute as @e[type=minecraft:endermite,tag=!ESF_ignore] run function endermitescriptframework:core/detect

# run scripts
execute as @e[tag=ESF_processing] at @s run function endermitescriptframework:core/processor

# dispose processed endermites
execute as @e[tag=ESF_processed] run function endermitescriptframework:core/dispose

# ignore endermites that were not processed
execute as @e[tag=ESF_processing] run function endermitescriptframework:core/ignore

# loop
schedule function endermitescriptframework:core/main 4t