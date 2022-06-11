function dimensionaldoors:packages/conduitdetection-3.00.00

execute if score DD$dirty DimensionalDoors = BOOL$true DatapackManager run function dimensionaldoors:tickupdates/update

# tick
schedule function dimensionaldoors:ticker/1s-3.00.00 1s
