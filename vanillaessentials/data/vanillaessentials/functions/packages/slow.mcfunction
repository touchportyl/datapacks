#> -----------------------------------------------
#> Vanilla Essentials Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


# functionality goes here
# refer to Tinkerer's Craft to see a fully implemented and functioning version of this system

# as standardisation:
# - all scripts used by the main script should be placed in ../modules/
# - particle effects should be seperated into ../modules/effects/
# - every custom entity should have the vanillaessentials tag
# - every tag/name (except the one above) should have the VE_ prefix
# - fake players should be named $ve.<name>


# player counter
function vanillaessentials:modules/playercounter

# sleep skip (deprecated)
#function vanillaessentials:modules/sleepskip/detection

# path speed
execute as @a[scores={VE_PathSpeed=1}] run function vanillaessentials:modules/pathspeed/effect

# creep away
execute as @e[type=armor_stand,nbt={ArmorItems:[{},{},{},{id:"minecraft:creeper_head"}]}] at @s run function vanillaessentials:modules/creepaway

# triggers
function vanillaessentials:triggers/checker

# hooks
function vanillaessentials:packages/hooks/listen


#> End of file
#> -----------
