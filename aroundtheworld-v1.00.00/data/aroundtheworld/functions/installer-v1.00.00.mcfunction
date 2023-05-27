tellraw @a[tag=aw_debug] [{"text":"AW","color":"blue"},{"text":" > installer-v1.00.00.mcfunction","color":"gray"}]

# set secret
scoreboard players operation FLAG$secret AroundTheWorld = FLAG$secret DatapackManager



# write your installation code here

# create scoreboards
# create bossbars
# set variables
# start datapack



# notify
scoreboard players operation ALERT$installed AroundTheWorld = BOOL$true DatapackManager
scoreboard players operation FLAG$dirty AroundTheWorld = BOOL$true DatapackManager