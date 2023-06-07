# effects
particle minecraft:flash ~ ~1 ~ 0 0 0 0 1 normal

# compatibility
execute unless score VERSION$datapack.current DimensionalDoors matches 19.. run particle minecraft:explosion ~ ~1 ~ 0 0 0 0 1 normal
execute if score VERSION$datapack.current DimensionalDoors matches 19.. run function dimensionaldoors:compatibility/sonic_boom

playsound minecraft:block.conduit.activate block @a[distance=..32] ~ ~ ~ 1 2 0