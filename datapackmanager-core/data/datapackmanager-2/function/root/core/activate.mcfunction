# This generation won the election. Claim the active slot and run.
# VERSION$framework.active names the winning generation; every loop and command guards on it,
# so if a newer generation is installed later and wins, this generation's loops see the slot
# change out from under them and self-terminate.
scoreboard players set VERSION$framework.active DatapackManager 20000

function datapackmanager-2:root/core/initialize
function datapackmanager-2:root/loops/main/start
