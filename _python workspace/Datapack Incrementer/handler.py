import os

# increment version number in very specific places
def IncrementVersion(versionType = 1):

    # datapack to increment
    targettxt = os.path.join(os.path.dirname(os.path.abspath(__file__)),'target.txt')
    with open(targettxt) as path:
        targetPath = os.path.normpath(path.readline())


    # get the folder version number and increment

    # explained:
    # 1. split the target path twice to extract the version (v1.00.00)
    base_datapack = os.path.split(targetPath)
    name_version = base_datapack[1].split('-')
    datapackFullName_lower = name_version[0]
    versionFull_old = name_version[1]

    # 2. compress to get the numerical value (10000)
    versionCompressed_old = ''.join([n for n in versionFull_old if n.isdigit()])

    # 3. add the increment value (major = +10000 / minor = +100 / patch = +1)
    versionCompressed_new = str(int(versionCompressed_old) + versionType)

    # 4. decompress the updated version
    versionFull_new = 'v' + versionCompressed_new[0] + '.' + versionCompressed_new[1] + versionCompressed_new[2] + '.' + versionCompressed_new[3] + versionCompressed_new[4]

    # for each specific file in the datapack, replace with the new version number
    pathList = [
        f'data/{datapackFullName_lower}/advancements/{datapackFullName_lower}.json',
        f'data/{datapackFullName_lower}/functions/packages/slowupdates/functions/disablepack.mcfunction',
        f'data/{datapackFullName_lower}/functions/config.mcfunction',
        f'{targettxt}'
    ]
    replacements = {
        versionFull_old: versionFull_new,
        versionCompressed_old: versionCompressed_new
    }

    for path in pathList:
        fullpath = os.path.join(targetPath,os.path.normpath(path))

        with open(fullpath, "r+") as file:
            contents = file.read()
            
            for src, target in replacements.items():
                contents = contents.replace(src, target)
            
            file.seek(0)
            file.write(contents)

    # rename main datapack folder
    os.rename(targetPath, os.path.join(base_datapack[0], '-'.join([datapackFullName_lower,versionFull_new])))