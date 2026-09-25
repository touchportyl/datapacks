# Runs only in the active generation, once per load.
# Supported Minecraft range, encoded major*10000 + minor*100 + patch. Year.drop releases are
# stored as 1.<year>.<drop>, so 26.3 is 12603. backward: 1.14.4, the /schedule floor. forward:
# 26.3, the newest leaf. Anything newer saturates at 12603 until a sentinel leaf exists, so
# pack.mcmeta's max_format is the guard for versions newer than 26.3.
scoreboard players set VERSION$minecraft.backward DatapackManager 11404
scoreboard players set VERSION$minecraft.forward DatapackManager 12603

function datapackmanager-2:packages/versioning/check

function datapackmanager-2:root/command/create

# Tell everyone which Minecraft was detected.
execute as @a run function datapackmanager-2:packages/alerts/minecraft_version

# Announce ourselves on the public bus so third-party datapacks can initialise off dm:load
# on this same tick instead of polling.
function #datapackmanager:event/load
