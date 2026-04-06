# notify
function datapackmanager:tickupdates/alerts/configurationloaded

# default values
scoreboard players set VERSION$minecraft.backward DatapackManager 19
scoreboard players operation VERSION$minecraft.forward DatapackManager = VERSION$minecraft.backward DatapackManager

# load
function datapackmanager:config
