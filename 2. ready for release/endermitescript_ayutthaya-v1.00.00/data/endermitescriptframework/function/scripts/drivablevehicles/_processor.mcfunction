# register new vehicles here
tag @s[name="/drivable vehicles create cabriolet"] add ESF_processed
execute as @s[name="/drivable vehicles create cabriolet",tag=ESF_processed] at @s run function endermitescriptframework:scripts/drivablevehicles/vehicles/ground/cabriolet/spawn

tag @s[name="/drivable vehicles destroy cabriolet"] add ESF_processed
execute as @s[name="/drivable vehicles destroy cabriolet",tag=ESF_processed] at @s run function endermitescriptframework:scripts/drivablevehicles/vehicles/ground/cabriolet/delete

tag @s[name="/drivable vehicles create cruzer"] add ESF_processed
execute as @s[name="/drivable vehicles create cruzer",tag=ESF_processed] at @s run function endermitescriptframework:scripts/drivablevehicles/vehicles/ground/cruzer/spawn

tag @s[name="/drivable vehicles destroy cruzer"] add ESF_processed
execute as @s[name="/drivable vehicles destroy cruzer",tag=ESF_processed] at @s run function endermitescriptframework:scripts/drivablevehicles/vehicles/ground/cruzer/delete