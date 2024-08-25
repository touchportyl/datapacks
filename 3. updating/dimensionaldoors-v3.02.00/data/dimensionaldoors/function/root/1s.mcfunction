# only run if someone on the server has the conduit advancement
# this is to prevent the function from running when no one has the advancement
execute if entity @a[advancements={dimensionaldoors:adventure/find_conduit=true}] run function dimensionaldoors:root/create/conduitdetection

# check for open doors and close them
execute as @e[tag=DD_portal] at @s run function dimensionaldoors:root/closermechanism/autoclose



# loop
schedule function dimensionaldoors:root/1s 1s