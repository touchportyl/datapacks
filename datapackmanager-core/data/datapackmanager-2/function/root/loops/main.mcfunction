# The one loop. It runs only while this generation holds the active slot; the moment a newer
# generation takes over, the guard fails, the loop does not reschedule, and it stops on its own.
# No `replace` keyword and no `schedule clear` anywhere: both are 1.15+, and bare `schedule`
# already replaces on 1.14, so the whole loop stays inside the 1.14.4 floor.
execute if score VERSION$framework.active DatapackManager matches 20000 run function datapackmanager-2:root/command/manager
execute if score VERSION$framework.active DatapackManager matches 20000 run schedule function datapackmanager-2:root/loops/main 1s
