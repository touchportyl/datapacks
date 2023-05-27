#> -----------------------------------------------
#> Harvester Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> beetroot (references: ../modules/harvest/controller)
# this code harvests and replants one plot of beetroot


# harvest
execute if entity @s[tag=H_beetroot] run setblock ~ ~1 ~ minecraft:beetroots[age=0] destroy
execute if entity @s[tag=!H_beetroot] run setblock ~ ~1 ~ minecraft:air destroy

# xp reward for replanting
execute if entity @s[tag=H_beetroot] run summon experience_orb ~ ~ ~ {Age:5960,Health:1,Value:1}
execute if score $h.rand.4 H_rand matches 1 run summon experience_orb ~ ~ ~ {Age:5960,Health:1,Value:1}

# remove seeds
execute if entity @s[tag=H_beetroot] if score $h.rand.4 H_rand matches 1 run clear @s minecraft:beetroot_seeds 1

# grant advancement
advancement grant @s only harvester:you_can_do_that

# semi-persistent tag
tag @s add H_success


#> End of file
#> -----------
