# guard: version is up to date
execute if score VERSION$current SwiftGhasts = VERSION$expected SwiftGhasts \
  run return fail

# upgrade version step by step
execute unless score VERSION$current SwiftGhasts matches 10001.. \
  run function swiftghasts:versioning/updater/v10000_to_10001

# log warning if version is not up to date
execute if score VERSION$current SwiftGhasts != VERSION$expected SwiftGhasts run function swiftghasts:log_message {"type":"Warning","message":"Unexpected datapack version."}