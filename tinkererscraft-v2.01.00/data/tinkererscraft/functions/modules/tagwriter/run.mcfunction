#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> run (references: ../modules/casting/custom_items)
# this runs all the tagwriter modules
# the tagwriter will wipe data off the item

scoreboard players reset @s TC_TagWriter


#function tinkererscraft:modules/tagwriter/enchants
data modify entity @s Item.tag.Enchantments set value []

execute if entity @s[nbt={Item:{tag:{TinkerersCraft:{Enchants:{Unbreaking:{Enabled:1b}}}}}}] run data modify entity @s Item.tag.Enchantments append value {id:"minecraft:unbreaking",lvl:1s}
execute if entity @s[nbt={Item:{tag:{TinkerersCraft:{Enchants:{Unbreaking:{Enabled:1b}}}}}}] store result entity @s Item.tag.Enchantments[-1].lvl int 1 run data get entity @s Item.tag.TinkerersCraft.Enchants.Unbreaking.Level

execute if entity @s[nbt={Item:{tag:{TinkerersCraft:{Enchants:{Efficiency:{Enabled:1b}}}}}}] run data modify entity @s Item.tag.Enchantments append value {id:"minecraft:efficiency",lvl:1s}
execute if entity @s[nbt={Item:{tag:{TinkerersCraft:{Enchants:{Efficiency:{Enabled:1b}}}}}}] store result entity @s Item.tag.Enchantments[-1].lvl int 1 run data get entity @s Item.tag.TinkerersCraft.Enchants.Efficiency.Level

execute if entity @s[nbt={Item:{tag:{TinkerersCraft:{Enchants:{Sharpness:{Enabled:1b}}}}}}] run data modify entity @s Item.tag.Enchantments append value {id:"minecraft:sharpness",lvl:1s}
execute if entity @s[nbt={Item:{tag:{TinkerersCraft:{Enchants:{Sharpness:{Enabled:1b}}}}}}] store result entity @s Item.tag.Enchantments[-1].lvl int 1 run data get entity @s Item.tag.TinkerersCraft.Enchants.Sharpness.Level

execute if entity @s[nbt={Item:{tag:{TinkerersCraft:{Enchants:{Fortune:{Enabled:1b}}}}}}] run data modify entity @s Item.tag.Enchantments append value {id:"minecraft:fortune",lvl:1s}
execute if entity @s[nbt={Item:{tag:{TinkerersCraft:{Enchants:{Fortune:{Enabled:1b}}}}}}] store result entity @s Item.tag.Enchantments[-1].lvl int 1 run data get entity @s Item.tag.TinkerersCraft.Enchants.Fortune.Level

execute if entity @s[nbt={Item:{tag:{TinkerersCraft:{Enchants:{Looting:{Enabled:1b}}}}}}] run data modify entity @s Item.tag.Enchantments append value {id:"minecraft:looting",lvl:1s}
execute if entity @s[nbt={Item:{tag:{TinkerersCraft:{Enchants:{Looting:{Enabled:1b}}}}}}] store result entity @s Item.tag.Enchantments[-1].lvl int 1 run data get entity @s Item.tag.TinkerersCraft.Enchants.Looting.Level

execute if entity @s[nbt={Item:{tag:{TinkerersCraft:{Enchants:{FireAspect:{Enabled:1b}}}}}}] run data modify entity @s Item.tag.Enchantments append value {id:"minecraft:fire_aspect",lvl:1s}
execute if entity @s[nbt={Item:{tag:{TinkerersCraft:{Enchants:{FireAspect:{Enabled:1b}}}}}}] store result entity @s Item.tag.Enchantments[-1].lvl int 1 run data get entity @s Item.tag.TinkerersCraft.Enchants.FireAspect.Level

execute if entity @s[nbt={Item:{tag:{TinkerersCraft:{Enchants:{Sweeping:{Enabled:1b}}}}}}] run data modify entity @s Item.tag.Enchantments append value {id:"minecraft:sweeping",lvl:1s}
execute if entity @s[nbt={Item:{tag:{TinkerersCraft:{Enchants:{Sweeping:{Enabled:1b}}}}}}] store result entity @s Item.tag.Enchantments[-1].lvl int 1 run data get entity @s Item.tag.TinkerersCraft.Enchants.Sweeping.Level


#function tinkererscraft:modules/tagwriter/lore
data modify entity @s Item.tag.display.Lore set value []

execute if entity @s[nbt={Item:{tag:{TinkerersCraft:{Lore:{Casted:"true"}}}}}] run data modify entity @s Item.tag.display.Lore append value '{"text":" ➥ Casted","color":"dark_gray","bold":"false","italic":"false"}'
execute if entity @s[nbt={Item:{tag:{TinkerersCraft:{Lore:{Lightweight:"true"}}}}}] run data modify entity @s Item.tag.display.Lore append value '{"text":" ➥ Lightweight","color":"dark_gray","bold":"false","italic":"false"}'
execute if entity @s[nbt={Item:{tag:{TinkerersCraft:{Lore:{Shiny:"true"}}}}}] run data modify entity @s Item.tag.display.Lore append value '{"text":" ➥ Shiny","color":"dark_gray","bold":"false","italic":"false"}'
execute if entity @s[nbt={Item:{tag:{TinkerersCraft:{Lore:{Prospector:"true"}}}}}] run data modify entity @s Item.tag.display.Lore append value '{"text":" ➥ Prospector","color":"dark_gray","bold":"false","italic":"false"}'
execute if entity @s[nbt={Item:{tag:{TinkerersCraft:{Lore:{Heated:"true"}}}}}] run data modify entity @s Item.tag.display.Lore append value '{"text":" ➥ Heated","color":"dark_gray","bold":"false","italic":"false"}'


#function tinkererscraft:modules/tagwriter/spawn
#data modify entity @s Motion set value [0.0d,0.0d,0.0d]

#execute store result entity @s Motion[0] double 1 run data get entity @s Item.tag.TinkerersCraft.Spawn.Motion[0]
#execute store result entity @s Motion[1] double 1 run data get entity @s Item.tag.TinkerersCraft.Spawn.Motion[1]
#execute store result entity @s Motion[2] double 1 run data get entity @s Item.tag.TinkerersCraft.Spawn.Motion[2]





#> End of file
#> -----------
