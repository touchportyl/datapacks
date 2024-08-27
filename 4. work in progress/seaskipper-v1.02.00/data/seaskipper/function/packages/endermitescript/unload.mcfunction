# stop the main loop
function seaskipper:packages/endermitescript/loops/main/stop

# clean up
tag @e[tag=ES_tagged] remove ES_tagged
tag @e[tag=ES_parsed] remove ES_parsed
tag @e[tag=ES_ignore] remove ES_ignore