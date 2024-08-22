tellraw @a[tag=$datapackID_lower_debug] [{"text":"$datapackID","color":"$datapackColor"},{"text":" > installer-$datapackDisplayVersion.mcfunction","color":"gray"}]

# set secret
scoreboard players operation FLAG$secret $datapackFullName = FLAG$secret DatapackManager



# write your installation code here

# create scoreboards
# create bossbars
# set variables
# start datapack



# notify
scoreboard players operation ALERT$installed $datapackFullName = BOOL$true DatapackManager
scoreboard players operation FLAG$dirty $datapackFullName = BOOL$true DatapackManager