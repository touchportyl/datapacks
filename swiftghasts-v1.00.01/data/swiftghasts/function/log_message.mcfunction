$tellraw @s[tag=SG_log] [ \
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
    "text":" > [$(type)] " \
  }, \
  { \
    "text":"$(message)", \
    "color":"gray", \
    "italic":true \
  } \
]