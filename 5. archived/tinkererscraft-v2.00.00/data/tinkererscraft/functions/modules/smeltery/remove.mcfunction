#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> remove (references: ../modules/smeltery/check)
# this code clears up the smeltery components


#pfx:boom
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 1 force

#sfx:boom
playsound minecraft:entity.generic.explode block @a ~ ~ ~ 1 1 0
playsound minecraft:entity.firework_rocket.twinkle block @a ~ ~ ~ 0.8 1 0
playsound minecraft:block.conduit.deactivate master @a ~ ~ ~ 0.6 1 0

execute as @s at @s positioned ^ ^1 ^1 run kill @e[type=minecraft:area_effect_cloud,tag=TC_display,distance=..1]
kill @s


#> End of file
#> -----------
