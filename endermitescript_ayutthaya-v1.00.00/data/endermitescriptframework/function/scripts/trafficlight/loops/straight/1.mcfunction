# traffic cycle table
# |---------------|-------------|----------|
# | traffic light | walk signal | duration |
# |---------------|-------------|----------|
# | green         | red         | 6s       |
# | red           | red         | 2s       |
# | red           | green       | 6s       |
# | red           | red         | 2s       |
# |---------------|-------------|----------|

# reset
function endermitescriptframework:scripts/trafficlight/structure/trafficlight/reset
function endermitescriptframework:scripts/trafficlight/structure/walksignal/reset

# traffic light
function endermitescriptframework:scripts/trafficlight/structure/trafficlight/set_green
# walk signal
function endermitescriptframework:scripts/trafficlight/structure/walksignal/set_red

# schedule next
schedule function endermitescriptframework:scripts/trafficlight/loops/straight/2 6s