import os
import glob
import json

# replacement tags
replacements = {
    '$datapackDisplayName': str(datapackDisplayName),
    '$datapackFullName_lower': str(datapackFullName_lower),
    '$datapackFullName': str(datapackFullName),
    '$datapackID_lower': str(datapackID_lower),
    '$datapackID': str(datapackID),
    '$datapackColor': str(datapackColor),
    '$datapackPackVersion': str(datapackPackVersion),
    '$datapackDescription': str(datapackDescription),
    '$datapackDisplayVersion': str(datapackDisplayVersion),
    '$datapackFullVersion': str(datapackFullVersion),
    '$datapackManagerDisplayVersion': str(datapackManagerDisplayVersion),
    '$datapackManagerFullVersion': str(datapackManagerFullVersion)
}


for filepath in glob.iglob('./**/*.mcfunction', recursive=True):
    with open(filepath) as file:
        s = file.read()
    s = s.replace('hello', 'world')
    with open(filepath, "w") as file:
        file.write(s)