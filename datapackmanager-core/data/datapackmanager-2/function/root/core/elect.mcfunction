# Latest-version arbitration, part 2: run one tick after load, once every generation present
# has registered its version into VERSION$framework.latest.
scoreboard players set VERSION$framework.candidate DatapackManager 20000

# A newer generation is installed -> stand down and stay inert.
execute if score VERSION$framework.candidate DatapackManager < VERSION$framework.latest DatapackManager run function datapackmanager-2:root/core/disable

# This IS the newest generation installed -> take over.
execute unless score VERSION$framework.candidate DatapackManager < VERSION$framework.latest DatapackManager run function datapackmanager-2:root/core/activate
