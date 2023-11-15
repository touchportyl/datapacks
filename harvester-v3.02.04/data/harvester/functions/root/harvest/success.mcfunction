# this code runs after the harvesting process was successful


# grant advancement
advancement grant @s only harvester:you_can_do_that

# damage tools
execute as @s if score CONFIG$tooldamage Harvester = BOOL$true DatapackManager run function harvester:root/inventory/damage

# add semi-persistent tag
tag @s add HV_success
