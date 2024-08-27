#fx:boom
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 1 force

playsound minecraft:entity.generic.explode block @a[distance=..15] ~ ~ ~ 1 1 0
playsound minecraft:entity.firework_rocket.twinkle block @a[distance=..15] ~ ~ ~ 0.8 1 0
playsound minecraft:block.conduit.deactivate master @a[distance=..15] ~ ~ ~ 0.6 1 0