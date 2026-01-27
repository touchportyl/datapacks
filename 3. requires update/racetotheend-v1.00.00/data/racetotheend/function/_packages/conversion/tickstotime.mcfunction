# Converts ticks to time units (hours, minutes, seconds, ticks)
# Call with: /function namespace:_packages/conversion/tickstotime {input_storage:"storage:name", input_path:"path.to.ticks", output_storage:"storage:name", output_path:"path.to.output"}
# Outputs to storage at specified output path with structure: {hours:int, minutes:int, seconds:int, ticks:int, minutesNeedsLeadingZero:byte, secondsNeedsLeadingZero:byte, ticksNeedsLeadingZero:byte}

# Create temp objectives
scoreboard objectives add CV_time dummy {"text":"Conversion: Time Units","color":"yellow"}

# Get input value from storage
$execute store result score TIMER$input CV_time run data get storage $(input_storage) $(input_path)

# Initialize variables
scoreboard players set TIMER$ticks CV_time 0
scoreboard players set TIMER$seconds CV_time 0
scoreboard players set TIMER$minutes CV_time 0
scoreboard players set TIMER$hours CV_time 0

# Constants
scoreboard players set CONST$20 CV_time 20
scoreboard players set CONST$1200 CV_time 1200
scoreboard players set CONST$72000 CV_time 72000

# Calculate hours (input / 72000)
scoreboard players operation TIMER$hours CV_time = TIMER$input CV_time
scoreboard players operation TIMER$hours CV_time /= CONST$72000 CV_time

# Calculate remaining after hours (input % 72000)
scoreboard players operation TIMER$temp CV_time = TIMER$input CV_time
scoreboard players operation TIMER$temp CV_time %= CONST$72000 CV_time

# Calculate minutes (remaining / 1200)
scoreboard players operation TIMER$minutes CV_time = TIMER$temp CV_time
scoreboard players operation TIMER$minutes CV_time /= CONST$1200 CV_time

# Calculate remaining after minutes (remaining % 1200)
scoreboard players operation TIMER$temp CV_time %= CONST$1200 CV_time

# Calculate seconds (remaining / 20)
scoreboard players operation TIMER$seconds CV_time = TIMER$temp CV_time
scoreboard players operation TIMER$seconds CV_time /= CONST$20 CV_time

# Calculate remaining ticks (remaining % 20)
scoreboard players operation TIMER$ticks CV_time = TIMER$temp CV_time
scoreboard players operation TIMER$ticks CV_time %= CONST$20 CV_time

# Store results back to storage
$execute store result storage $(output_storage) $(output_path).hours int 1 run scoreboard players get TIMER$hours CV_time
$execute store result storage $(output_storage) $(output_path).minutes int 1 run scoreboard players get TIMER$minutes CV_time
$execute store result storage $(output_storage) $(output_path).seconds int 1 run scoreboard players get TIMER$seconds CV_time
$execute store result storage $(output_storage) $(output_path).ticks int 1 run scoreboard players get TIMER$ticks CV_time

# create storage flags for leading zeros
$execute if score TIMER$minutes CV_time matches 0..9 run data modify storage $(output_storage) $(output_path).minutesZero set value "0"
$execute unless score TIMER$minutes CV_time matches 0..9 run data modify storage $(output_storage) $(output_path).minutesZero set value ""
$execute if score TIMER$seconds CV_time matches 0..9 run data modify storage $(output_storage) $(output_path).secondsZero set value "0"
$execute unless score TIMER$seconds CV_time matches 0..9 run data modify storage $(output_storage) $(output_path).secondsZero set value ""
$execute if score TIMER$ticks CV_time matches 0..9 run data modify storage $(output_storage) $(output_path).ticksZero set value "0"
$execute unless score TIMER$ticks CV_time matches 0..9 run data modify storage $(output_storage) $(output_path).ticksZero set value ""

# Debugging
#$tellraw @a [{"text":"\n "},{"text":"Conversion: Ticks to Time Debug Output","underlined":true},{"text":"\n"},{"text":"\n | Input Ticks: "},{"nbt":"$(input_path)","storage":"$(input_storage)","color":"yellow"},{"text":"\n | Hours: "},{"nbt":"$(output_path).hours","storage":"$(output_storage)","color":"yellow"},{"text":"\n | Minutes: "},{"nbt":"$(output_path).minutesZero","storage":"$(output_storage)","color":"yellow"},{"nbt":"$(output_path).minutes","storage":"$(output_storage)","color":"yellow"},{"text":"\n | Seconds: "},{"nbt":"$(output_path).secondsZero","storage":"$(output_storage)","color":"yellow"},{"nbt":"$(output_path).seconds","storage":"$(output_storage)","color":"yellow"},{"text":"\n | Ticks: "},{"nbt":"$(output_path).ticksZero","storage":"$(output_storage)","color":"yellow"},{"nbt":"$(output_path).ticks","storage":"$(output_storage)","color":"yellow"},{"text":"\n"}]

# Cleanup: remove temporary objective
scoreboard objectives remove CV_time