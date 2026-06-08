# converts splits into time format and stores in the storage specified
# example use: execute as @a run function racetotheend:stats/processsplits {output_storage:"racetotheend:temp", output_path:"ranking"}
# cleanup output storage/path after use

execute store result storage racetotheend:temp stats.input int 1 run scoreboard players get TIMER$total RaceToTheEnd
$function racetotheend:_packages/conversion/tickstotime {input_storage:"racetotheend:temp", input_path:"stats.input", output_storage:"$(output_storage)", output_path:"$(output_path).current"}

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

# flatten hierarchy for macro usage
$data modify storage $(output_storage) $(output_path).current_hours set from storage $(output_storage) $(output_path).current.hours
$data modify storage $(output_storage) $(output_path).current_minutesZero set from storage $(output_storage) $(output_path).current.minutesZero
$data modify storage $(output_storage) $(output_path).current_minutes set from storage $(output_storage) $(output_path).current.minutes
$data modify storage $(output_storage) $(output_path).current_secondsZero set from storage $(output_storage) $(output_path).current.secondsZero
$data modify storage $(output_storage) $(output_path).current_seconds set from storage $(output_storage) $(output_path).current.seconds
$data modify storage $(output_storage) $(output_path).current_ticksZero set from storage $(output_storage) $(output_path).current.ticksZero
$data modify storage $(output_storage) $(output_path).current_ticks set from storage $(output_storage) $(output_path).current.ticks

$data modify storage $(output_storage) $(output_path).nether_hours set from storage $(output_storage) $(output_path).nether.hours
$data modify storage $(output_storage) $(output_path).nether_minutesZero set from storage $(output_storage) $(output_path).nether.minutesZero
$data modify storage $(output_storage) $(output_path).nether_minutes set from storage $(output_storage) $(output_path).nether.minutes
$data modify storage $(output_storage) $(output_path).nether_secondsZero set from storage $(output_storage) $(output_path).nether.secondsZero
$data modify storage $(output_storage) $(output_path).nether_seconds set from storage $(output_storage) $(output_path).nether.seconds
$data modify storage $(output_storage) $(output_path).nether_ticksZero set from storage $(output_storage) $(output_path).nether.ticksZero
$data modify storage $(output_storage) $(output_path).nether_ticks set from storage $(output_storage) $(output_path).nether.ticks

$data modify storage $(output_storage) $(output_path).bastion_hours set from storage $(output_storage) $(output_path).bastion.hours
$data modify storage $(output_storage) $(output_path).bastion_minutesZero set from storage $(output_storage) $(output_path).bastion.minutesZero
$data modify storage $(output_storage) $(output_path).bastion_minutes set from storage $(output_storage) $(output_path).bastion.minutes
$data modify storage $(output_storage) $(output_path).bastion_secondsZero set from storage $(output_storage) $(output_path).bastion.secondsZero
$data modify storage $(output_storage) $(output_path).bastion_seconds set from storage $(output_storage) $(output_path).bastion.seconds
$data modify storage $(output_storage) $(output_path).bastion_ticksZero set from storage $(output_storage) $(output_path).bastion.ticksZero
$data modify storage $(output_storage) $(output_path).bastion_ticks set from storage $(output_storage) $(output_path).bastion.ticks

$data modify storage $(output_storage) $(output_path).enderpearl_hours set from storage $(output_storage) $(output_path).enderpearl.hours
$data modify storage $(output_storage) $(output_path).enderpearl_minutesZero set from storage $(output_storage) $(output_path).enderpearl.minutesZero
$data modify storage $(output_storage) $(output_path).enderpearl_minutes set from storage $(output_storage) $(output_path).enderpearl.minutes
$data modify storage $(output_storage) $(output_path).enderpearl_secondsZero set from storage $(output_storage) $(output_path).enderpearl.secondsZero
$data modify storage $(output_storage) $(output_path).enderpearl_seconds set from storage $(output_storage) $(output_path).enderpearl.seconds
$data modify storage $(output_storage) $(output_path).enderpearl_ticksZero set from storage $(output_storage) $(output_path).enderpearl.ticksZero
$data modify storage $(output_storage) $(output_path).enderpearl_ticks set from storage $(output_storage) $(output_path).enderpearl.ticks

$data modify storage $(output_storage) $(output_path).fortress_hours set from storage $(output_storage) $(output_path).fortress.hours
$data modify storage $(output_storage) $(output_path).fortress_minutesZero set from storage $(output_storage) $(output_path).fortress.minutesZero
$data modify storage $(output_storage) $(output_path).fortress_minutes set from storage $(output_storage) $(output_path).fortress.minutes
$data modify storage $(output_storage) $(output_path).fortress_secondsZero set from storage $(output_storage) $(output_path).fortress.secondsZero
$data modify storage $(output_storage) $(output_path).fortress_seconds set from storage $(output_storage) $(output_path).fortress.seconds
$data modify storage $(output_storage) $(output_path).fortress_ticksZero set from storage $(output_storage) $(output_path).fortress.ticksZero
$data modify storage $(output_storage) $(output_path).fortress_ticks set from storage $(output_storage) $(output_path).fortress.ticks

$data modify storage $(output_storage) $(output_path).blazerod_hours set from storage $(output_storage) $(output_path).blazerod.hours
$data modify storage $(output_storage) $(output_path).blazerod_minutesZero set from storage $(output_storage) $(output_path).blazerod.minutesZero
$data modify storage $(output_storage) $(output_path).blazerod_minutes set from storage $(output_storage) $(output_path).blazerod.minutes
$data modify storage $(output_storage) $(output_path).blazerod_secondsZero set from storage $(output_storage) $(output_path).blazerod.secondsZero
$data modify storage $(output_storage) $(output_path).blazerod_seconds set from storage $(output_storage) $(output_path).blazerod.seconds
$data modify storage $(output_storage) $(output_path).blazerod_ticksZero set from storage $(output_storage) $(output_path).blazerod.ticksZero
$data modify storage $(output_storage) $(output_path).blazerod_ticks set from storage $(output_storage) $(output_path).blazerod.ticks

$data modify storage $(output_storage) $(output_path).stronghold_hours set from storage $(output_storage) $(output_path).stronghold.hours
$data modify storage $(output_storage) $(output_path).stronghold_minutesZero set from storage $(output_storage) $(output_path).stronghold.minutesZero
$data modify storage $(output_storage) $(output_path).stronghold_minutes set from storage $(output_storage) $(output_path).stronghold.minutes
$data modify storage $(output_storage) $(output_path).stronghold_secondsZero set from storage $(output_storage) $(output_path).stronghold.secondsZero
$data modify storage $(output_storage) $(output_path).stronghold_seconds set from storage $(output_storage) $(output_path).stronghold.seconds
$data modify storage $(output_storage) $(output_path).stronghold_ticksZero set from storage $(output_storage) $(output_path).stronghold.ticksZero
$data modify storage $(output_storage) $(output_path).stronghold_ticks set from storage $(output_storage) $(output_path).stronghold.ticks

$data modify storage $(output_storage) $(output_path).end_hours set from storage $(output_storage) $(output_path).end.hours
$data modify storage $(output_storage) $(output_path).end_minutesZero set from storage $(output_storage) $(output_path).end.minutesZero
$data modify storage $(output_storage) $(output_path).end_minutes set from storage $(output_storage) $(output_path).end.minutes
$data modify storage $(output_storage) $(output_path).end_secondsZero set from storage $(output_storage) $(output_path).end.secondsZero
$data modify storage $(output_storage) $(output_path).end_seconds set from storage $(output_storage) $(output_path).end.seconds
$data modify storage $(output_storage) $(output_path).end_ticksZero set from storage $(output_storage) $(output_path).end.ticksZero
$data modify storage $(output_storage) $(output_path).end_ticks set from storage $(output_storage) $(output_path).end.ticks

$data modify storage $(output_storage) $(output_path).killdragon_hours set from storage $(output_storage) $(output_path).killdragon.hours
$data modify storage $(output_storage) $(output_path).killdragon_minutesZero set from storage $(output_storage) $(output_path).killdragon.minutesZero
$data modify storage $(output_storage) $(output_path).killdragon_minutes set from storage $(output_storage) $(output_path).killdragon.minutes
$data modify storage $(output_storage) $(output_path).killdragon_secondsZero set from storage $(output_storage) $(output_path).killdragon.secondsZero
$data modify storage $(output_storage) $(output_path).killdragon_seconds set from storage $(output_storage) $(output_path).killdragon.seconds
$data modify storage $(output_storage) $(output_path).killdragon_ticksZero set from storage $(output_storage) $(output_path).killdragon.ticksZero
$data modify storage $(output_storage) $(output_path).killdragon_ticks set from storage $(output_storage) $(output_path).killdragon.ticks