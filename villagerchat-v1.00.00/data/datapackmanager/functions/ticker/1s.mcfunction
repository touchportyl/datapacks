execute if score DM$dirty DatapackManager = BOOL$true DatapackManager run function datapackmanager:tickupdates/update

scoreboard players operation DM$noschedulecommand DatapackManager = BOOL$false DatapackManager

# tick
schedule function datapackmanager:ticker/1s 1s
