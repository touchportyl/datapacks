function seaskipper:packages/endermitescript/root/success

tag @e[tag=Seaskipper,tag=SS_npc,distance=..2,sort=nearest,limit=1] add SS_destroy
tp @e[tag=SS_destroy] ~ -70 ~
kill @e[tag=SS_destroy]