execute as @e[tag=trafficlight,tag=x,tag=walksignal,tag=north,tag=!alt] at @s run setblock ~ ~ ~ minecraft:player_wall_head[facing=south]{profile:{properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYjA0OGNjMGRlZTA5NWJlNTgzOWZkZjJmN2QzODI1NTZjMDBjNjg2YzdlYjRiM2M2OTBiZTRkZjAyZjIxMmFhZCJ9fX0="}]}} replace

execute as @e[tag=trafficlight,tag=x,tag=walksignal,tag=south,tag=!alt] at @s run setblock ~ ~ ~ minecraft:player_wall_head[facing=north]{profile:{properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYjA0OGNjMGRlZTA5NWJlNTgzOWZkZjJmN2QzODI1NTZjMDBjNjg2YzdlYjRiM2M2OTBiZTRkZjAyZjIxMmFhZCJ9fX0="}]}} replace

execute as @e[tag=trafficlight,tag=x,tag=walksignal,tag=east,tag=!alt] at @s run setblock ~ ~ ~ minecraft:player_wall_head[facing=west]{profile:{properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYjA0OGNjMGRlZTA5NWJlNTgzOWZkZjJmN2QzODI1NTZjMDBjNjg2YzdlYjRiM2M2OTBiZTRkZjAyZjIxMmFhZCJ9fX0="}]}} replace

execute as @e[tag=trafficlight,tag=x,tag=walksignal,tag=west,tag=!alt] at @s run setblock ~ ~ ~ minecraft:player_wall_head[facing=east]{profile:{properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYjA0OGNjMGRlZTA5NWJlNTgzOWZkZjJmN2QzODI1NTZjMDBjNjg2YzdlYjRiM2M2OTBiZTRkZjAyZjIxMmFhZCJ9fX0="}]}} replace


# tag for blinker
tag @e[tag=trafficlight,tag=x,tag=walksignal,tag=!alt] add blinker