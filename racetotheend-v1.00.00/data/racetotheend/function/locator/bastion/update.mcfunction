# get distance to bastion
execute store result score @s RE_bastiondist run locate structure minecraft:bastion_remnant

# update bossbar
bossbar set racetotheend:locator/bastion name [{"text":"Bastion - ","color":"gray"},{"score":{"name":"@s","objective":"RE_bastiondist"},"color":"gold"},{"text":" blocks away","color":"gray"}]