# classify
function harvester:root/inventory/range

# check for seeds
function harvester:root/inventory/seeds

# filter > positioner > controller
execute if entity @s[x_rotation=0..90] run function harvester:root/positioner/filter