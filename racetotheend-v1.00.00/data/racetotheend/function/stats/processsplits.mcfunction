# converts splits into time format and stores in the storage specified
# example use: execute as @a run function racetotheend:stats/processsplits {output_storage:"racetotheend:temp", output_path:"ranking"}
# cleanup output storage/path after use

execute store result storage racetotheend:temp stats.input int 1 run scoreboard players get @s RE_Nether
$function racetotheend:_packages/conversion/tickstotime {input_storage:"racetotheend:temp", input_path:"stats.input", output_storage:"$(output_storage)", output_path:"$(output_path).nether"}

execute store result storage racetotheend:temp stats.input int 1 run scoreboard players get @s RE_Bastion
$function racetotheend:_packages/conversion/tickstotime {input_storage:"racetotheend:temp", input_path:"stats.input", output_storage:"$(output_storage)", output_path:"$(output_path).bastion"}

execute store result storage racetotheend:temp stats.input int 1 run scoreboard players get @s RE_EnderPearl
$function racetotheend:_packages/conversion/tickstotime {input_storage:"racetotheend:temp", input_path:"stats.input", output_storage:"$(output_storage)", output_path:"$(output_path).enderpearl"}

execute store result storage racetotheend:temp stats.input int 1 run scoreboard players get @s RE_Fortress
$function racetotheend:_packages/conversion/tickstotime {input_storage:"racetotheend:temp", input_path:"stats.input", output_storage:"$(output_storage)", output_path:"$(output_path).fortress"}

execute store result storage racetotheend:temp stats.input int 1 run scoreboard players get @s RE_BlazeRod
$function racetotheend:_packages/conversion/tickstotime {input_storage:"racetotheend:temp", input_path:"stats.input", output_storage:"$(output_storage)", output_path:"$(output_path).blazerod"}

execute store result storage racetotheend:temp stats.input int 1 run scoreboard players get @s RE_Stronghold
$function racetotheend:_packages/conversion/tickstotime {input_storage:"racetotheend:temp", input_path:"stats.input", output_storage:"$(output_storage)", output_path:"$(output_path).stronghold"}

execute store result storage racetotheend:temp stats.input int 1 run scoreboard players get @s RE_End
$function racetotheend:_packages/conversion/tickstotime {input_storage:"racetotheend:temp", input_path:"stats.input", output_storage:"$(output_storage)", output_path:"$(output_path).end"}

execute store result storage racetotheend:temp stats.input int 1 run scoreboard players get @s RE_KillDragon
$function racetotheend:_packages/conversion/tickstotime {input_storage:"racetotheend:temp", input_path:"stats.input", output_storage:"$(output_storage)", output_path:"$(output_path).killdragon"}