# give the appropriate version of book for that version


# v2.06 mc1.16
execute if score VERSION$minecraft.current DatapackManager matches 16 if score VERSION$datapack.current TinkerersCraft matches 20600..20699 run function tinkererscraft:root/guide/book/v2.06.00-mc1.16

# v2.06 mc1.17++
execute if score VERSION$minecraft.current DatapackManager matches 17.. if score VERSION$datapack.current TinkerersCraft matches 20600..20699 run function tinkererscraft:root/guide/book/v2.06.00