tellraw @a[tag=debug] [{"text":"VC > packages/installer-1.00.00.mcfunction","color":"gray"}]

# set secret
scoreboard players operation VC$secret VillagerChat = DM$secret DatapackManager


# create door id
scoreboard objectives add DD_doorID dummy [{"text":"Dimensional Doors - ID","color":"purple"}]
