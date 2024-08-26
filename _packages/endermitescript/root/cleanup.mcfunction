# remove parsed endermite
tp @e[tag=ES_parsed] ~ -70 ~
kill @e[tag=ES_parsed]

# ignore endermite that slipped through the filter
tag @e[tag=ES_tagged] add ES_ignore