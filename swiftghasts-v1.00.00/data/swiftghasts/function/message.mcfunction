$tellraw @s [ \
  { \
    "text":" ", \
    "color":"gray" \
  }, \
  { \
    "text":"Swift Ghasts", \
    "color":"white", \
    "hover_event": { \
      "action":"show_text", \
      "value":"Increases Happy Ghast flight speed for faster, smoother travel!" \
    } \
  }, \
  { \
    "text":" > " \
  }, \
  { \
    "text":"$(message)", \
    "color":"white" \
  } \
]
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.4 1
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.1 1.8 0.1
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.6 1