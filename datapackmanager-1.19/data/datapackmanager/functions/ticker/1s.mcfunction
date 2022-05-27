execute if score DM$dirty DatapackManager = BOOL$true DatapackManager run function datapackmanager:tickupdates/update
function datapackmanager:constructors/notification/tick

# tick
schedule function datapackmanager:ticker/1s 1s replace
