# run code every second

# only run if someone on the server has the conduit advancement
execute if entity @a[advancements={dimensionaldoors:adventure/find_conduit=true}] run function dimensionaldoors:root/create/conduitdetection


# tick open doors
execute as @e[tag=DD_portal] at @s run function dimensionaldoors:root/closermechanism/autoclose


# tick updates
execute if score FLAG$dirty DimensionalDoors = BOOL$true DatapackManager run function dimensionaldoors:packages/slowupdates/update

# tick
execute unless score LOOP$tickers.1s.isLooping DimensionalDoors = BOOL$false DatapackManager run schedule function dimensionaldoors:packages/tickers/1s-v3.01.00 1s