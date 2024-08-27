# this code adds sound and particle effects to the start of the pouring


#sfx:clang
playsound minecraft:block.anvil.place block @a[distance=..16] ^ ^ ^2 0.5 2 0

#sfx:pour
playsound minecraft:item.bucket.empty_lava block @a[distance=..16] ^ ^ ^2 1 0 0

#pfx:lava
particle minecraft:lava ^ ^ ^2 0 0 0 0 5 normal