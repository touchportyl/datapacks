import os

# create directory
def CreatePath(path):
    if not os.path.exists(path):
        os.makedirs(path)
    return path

# https://stackoverflow.com/a/13089373
def CopyAndReplace(fromPath, toPath, replacements = {}):
    with open(fromPath) as infile, open(toPath, 'w') as outfile:
        for line in infile:
            for src, target in replacements.items():
                line = line.replace(src, target)
            outfile.write(line)