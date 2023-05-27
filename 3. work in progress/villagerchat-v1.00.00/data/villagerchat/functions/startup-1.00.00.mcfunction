tellraw @a[tag=debug] [{"text":"VC > startup-1.00.00.mcfunction","color":"gray"}]

# create master scoreboard
# WARNING: THIS COMMAND MUST RUN BEFORE ANYTHING ELSE
scoreboard objectives add VillagerChat dummy [{"text":"Villager Chat","color":"yellow"}]

# initialize
execute unless score VC$secret VillagerChat = DM$secret DatapackManager run function villagerchat:packages/installer-1.00.00

# load config
scoreboard players operation FUNCTION$loadconfig VillagerChat = BOOL$true DatapackManager
# force to run inline
function villagerchat:tickupdates/update

# start tickers
function villagerchat:ticker/1t-1.00.00
function villagerchat:ticker/1s-1.00.00
