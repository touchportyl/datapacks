# Runs only in the active generation, once per load.
# Supported Minecraft range, encoded major*10000 + minor*100 + patch (each field stays below 100).
# backward: 1.14.4 - the /schedule floor. forward: one below the 26.3 sentinel leaf, so 26.3 and
# anything newer trips the "too new" alert.
scoreboard players set VERSION$minecraft.backward DatapackManager 11404
scoreboard players set VERSION$minecraft.forward DatapackManager 260299

function datapackmanager-2:packages/versioning/check

function datapackmanager-2:root/command/create

# Tell everyone which Minecraft was detected.
execute as @a run function datapackmanager-2:packages/alerts/minecraft_version

# Announce ourselves on the public bus so third-party datapacks can initialise off dm:load
# on this same tick instead of polling.
function #datapackmanager:event/load
