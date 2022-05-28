execute if score DM$dirty DatapackManager = BOOL$true DatapackManager run function datapackmanager:tickupdates/update

# tick
schedule clear datapackmanager:ticker/1s
schedule function datapackmanager:ticker/1s 1s replace
