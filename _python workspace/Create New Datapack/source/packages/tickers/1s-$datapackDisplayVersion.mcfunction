# run code every second
#function $datapackFullName_lower:yourfunction

# tick updates
execute if score FLAG$dirty $datapackFullName = BOOL$true DatapackManager run function $datapackFullName_lower:packages/slowupdates/update

# tick
schedule function $datapackFullName_lower:packages/tickers/1s-$datapackDisplayVersion 1s