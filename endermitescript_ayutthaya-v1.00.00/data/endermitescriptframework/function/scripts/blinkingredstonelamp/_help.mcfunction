tellraw @s [{"text":"\n Blinking Redstone Lamp Script Help","color":"white","bold":true}]
tellraw @s [{"text":" Creates blinking redstone lamps that turn off and on every 4 seconds.\n","color":"gray"}]

tellraw @s [{"text":"> ","color":"gray"},{"text":"/redstone lamp create","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/give @s minecraft:endermite_spawn_egg[minecraft:custom_name='/redstone lamp create']"}},{"text":" - Creates a blinking redstone lamp.\n"}]

tellraw @s [{"text":"> ","color":"gray"},{"text":"/redstone lamp destroy","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/give @s minecraft:endermite_spawn_egg[minecraft:custom_name='/redstone lamp destroy']"}},{"text":" - Removes a blinking redstone lamp.\n"}]

tellraw @s [{"text":"> ","color":"gray"},{"text":"/redstone lamp reveal","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/give @s minecraft:endermite_spawn_egg[minecraft:custom_name='/redstone lamp reveal']"}},{"text":" - Reveals the hidden entity used by the blinking redstone lamp for a short while.\n"}]
