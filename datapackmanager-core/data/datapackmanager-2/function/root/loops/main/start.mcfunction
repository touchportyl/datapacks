# Bare `schedule` (no `replace` keyword): a function can be scheduled only once, so this replaces
# on 1.14 and defaults to replace on 1.15+ - a /reload does not stack a second loop. The `replace`
# keyword and `schedule clear` are both 1.15+, so neither is used anywhere in this framework.
schedule function datapackmanager-2:root/loops/main 1s
