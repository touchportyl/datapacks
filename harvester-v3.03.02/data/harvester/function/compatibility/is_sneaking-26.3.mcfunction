# 26.3 renamed the predicate type field from condition to type, so the older predicate file no longer loads
execute as @a at @s if predicate harvester:26.3/player_checkers/is_sneaking align xz positioned ~0.5 ~ ~0.5 run function harvester:root/inventory/hoe
