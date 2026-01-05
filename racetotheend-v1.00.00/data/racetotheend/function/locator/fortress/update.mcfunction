# get distance to fortress
execute store result score @s RE_fortressdist run locate structure minecraft:fortress

# update bossbar
# uses timer/actionbar because @s doesn't work per player for bossbars (bossbars are global)
#bossbar set racetotheend:locator/fortress name [{"text":"Fortress - ","color":"gray"},{"score":{"name":"@s","objective":"RE_fortressdist"},"color":"red"},{"text":" blocks away","color":"gray"}]