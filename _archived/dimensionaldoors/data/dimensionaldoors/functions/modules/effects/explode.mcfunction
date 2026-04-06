#> -----------------------------------------------
#> Dimensional Doors Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> destroy


execute at @e[tag=DD_schedule_explode] run summon minecraft:fireball ~0.5 ~0.5 ~0.5 {Motion:[0.0,-10.0,0.0],ExplosionPower:2,ExplosionRadius:2}

tag @s remove DD_schedule_explode


#> End of file
#> -----------
