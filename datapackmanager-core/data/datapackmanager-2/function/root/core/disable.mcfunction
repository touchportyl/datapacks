# An older generation that lost the election. It does not need to actively stop anything:
# root/loops/main is guarded by `VERSION$framework.active matches 20000`, and the active slot now
# holds the newer generation's version, so this generation's loop fails its guard and does not
# reschedule - it stops on its own within one tick. (`schedule clear` would be more direct but is
# 1.15+, and this framework holds the 1.14.4 floor, so the self-terminating guard is used instead.)
