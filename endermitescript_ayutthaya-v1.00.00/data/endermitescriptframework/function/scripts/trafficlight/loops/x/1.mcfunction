# traffic cycle table
# |---------------|---------------------|-------------|-------------------|----------|
# | traffic light | traffic light (alt) | walk signal | walk signal (alt) | duration |
# |---------------|---------------------|-------------|-------------------|----------|
# | green         | red                 | red         | green             | 6s       |
# | green         | red                 | red         | red               | 4s       |
# | red           | red                 | red         | red               | 2s       |
# | red           | green               | green       | red               | 6s       |
# | red           | green               | red         | red               | 4s       |
# | red           | red                 | red         | red               | 2s       |
# |---------------|---------------------|-------------|-------------------|----------|

# reset
function endermitescriptframework:scripts/trafficlight/structure/trafficlight/reset_x
function endermitescriptframework:scripts/trafficlight/structure/walksignal/reset_x

# traffic light
function endermitescriptframework:scripts/trafficlight/structure/trafficlight/set_green_x
function endermitescriptframework:scripts/trafficlight/structure/trafficlight/set_red_x_alt

# walk signal
function endermitescriptframework:scripts/trafficlight/structure/walksignal/set_red_x
function endermitescriptframework:scripts/trafficlight/structure/walksignal/set_green_x_alt
# schedule next
schedule function endermitescriptframework:scripts/trafficlight/loops/x/2 6s