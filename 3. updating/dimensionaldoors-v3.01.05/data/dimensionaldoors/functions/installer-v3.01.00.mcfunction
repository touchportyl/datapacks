tellraw @a[tag=dd_debug] [{"text":"DD","color":"light_purple"},{"text":" > installer-v3.01.00.mcfunction","color":"gray"}]

# set secret
scoreboard players operation FLAG$secret DimensionalDoors = FLAG$secret DatapackManager



# write your installation code here

# create scoreboards
scoreboard objectives add DD_doorID dummy [{"text":"Door ID","color":"light_purple"}]
# create bossbars
# set variables
# start datapack



# notify
scoreboard players operation ALERT$installed DimensionalDoors = BOOL$true DatapackManager
scoreboard players operation FLAG$dirty DimensionalDoors = BOOL$true DatapackManager