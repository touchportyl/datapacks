tellraw @a[tag=hv_debug] [{"text":"HV","color":"gold"},{"text":" > installer-v3.01.00.mcfunction","color":"gray"}]


# write your installation code here

# create scoreboards
# create bossbars
# set variables
# start datapack


# notify
scoreboard players operation ALERT$installed Harvester = BOOL$true DatapackManager
scoreboard players operation FLAG$dirty Harvester = BOOL$true DatapackManager