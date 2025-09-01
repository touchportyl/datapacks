#> sweep (references: ../main)
# this code displays the feedback for a successful harvest

playsound minecraft:entity.player.attack.sweep block @a ~ ~ ~ 0.1 0 0
playsound minecraft:entity.player.attack.sweep block @a ~ ~ ~ 0.4 1.6 0
execute anchored eyes positioned ^ ^-0.5 ^1 run particle minecraft:sweep_attack ~ ~ ~ 0 0 0 0.1 1