# timer
execute if score EVENT$initialize.timer DatapackManager matches 0.. run scoreboard players add EVENT$initialize.timer DatapackManager 1
execute if score EVENT$command.config.timer DatapackManager matches 0.. run scoreboard players add EVENT$command.config.timer DatapackManager 1
execute if score EVENT$command.uninstall.timer DatapackManager matches 0.. run scoreboard players add EVENT$command.uninstall.timer DatapackManager 1

# cleanup events
execute if score EVENT$initialize.timer DatapackManager matches 2.. run function datapackmanager-26.3:root/events/event/initialize/cleanup
execute if score EVENT$command.config.timer DatapackManager matches 2.. run function datapackmanager-26.3:root/events/command/config/cleanup
execute if score EVENT$command.uninstall.timer DatapackManager matches 2.. run function datapackmanager-26.3:root/events/command/uninstall/cleanup
