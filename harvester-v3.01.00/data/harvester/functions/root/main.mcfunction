# main function


# get hoe
execute as @s at @s run function harvester:root/inventory/hoe


# classify
execute if entity @s[tag=HV_isHoldingHoe] run function harvester:root/inventory/range

# check for seeds
execute if entity @s[tag=HV_isHoldingHoe] run function harvester:root/inventory/seeds



# filter > positioner > controller
execute if entity @s[tag=HV_isHoldingHoe] run function harvester:root/positioner/filter