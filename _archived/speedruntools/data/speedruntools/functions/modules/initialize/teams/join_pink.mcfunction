#> -----------------------------------------------
#> Speedrun Tools Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> join pink
# this assigns teams to players in the speedrun


# fail msg
execute if entity @a[team=pink] run function speedruntools:modules/effects/ui/fail
execute if entity @a[team=pink] run title @s actionbar {"text":"There is already a player on pink.","bold":"true"}

# join only if team is empty
execute unless entity @a[team=pink] run function speedruntools:modules/effects/ui/click
execute unless entity @a[team=pink] run team leave @s
execute unless entity @a[team=pink] run team join pink @s

# update bossbar
function speedruntools:modules/initialize/bossbar


#> End of file
#> -----------
