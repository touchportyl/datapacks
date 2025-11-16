tellraw @s [{"text":"\n Traffic Light Script Help","color":"white","bold":true}]
tellraw @s [{"text":" Creates traffic lights and walk signals for your Minecraft world.\n","color":"gray"}]

tellraw @s [{"text":"> ","color":"gray"},{"text":"/traffic light create","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/give @s minecraft:endermite_spawn_egg[minecraft:custom_name='/traffic light create']"}},{"text":" - Creates a traffic light for a straight road crossing.\n"}]

tellraw @s [{"text":"> ","color":"gray"},{"text":"/traffic light create x","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/give @s minecraft:endermite_spawn_egg[minecraft:custom_name='/traffic light create x']"}},{"text":" - Creates a traffic light for an X-shaped road crossing.\n"}]

tellraw @s [{"text":"> ","color":"gray"},{"text":"/traffic light create x alt","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/give @s minecraft:endermite_spawn_egg[minecraft:custom_name='/traffic light create x alt']"}},{"text":" - Creates the alternate timed lights for the X-shaped road crossing.\n"}]

tellraw @s [{"text":"> ","color":"gray"},{"text":"/traffic light destroy","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/give @s minecraft:endermite_spawn_egg[minecraft:custom_name='/traffic light destroy']"}},{"text":" - Removes a traffic light and walk signal.\n"}]

tellraw @s [{"text":"> ","color":"gray"},{"text":"/traffic light reveal","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/give @s minecraft:endermite_spawn_egg[minecraft:custom_name='/traffic light reveal']"}},{"text":" - Reveals the hidden entity used by the traffic light and walk signal for a short while.\n"}]
