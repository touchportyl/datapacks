import os
import json
import shutil
from functions import CreatePath, CopyAndReplace


# data to use when generating a new datapack
# located in /config
jsonconfig = "aroundtheworld"



# get current working directory
workingpath = os.path.dirname(os.path.abspath(__file__))

# ensure folders exists
outputpath = os.path.join(workingpath,'output')
CreatePath(outputpath)
sourcepath = os.path.join(workingpath,'source')
CreatePath(sourcepath)



# get datapack config
with open(os.path.join(workingpath,'config',f'{jsonconfig}.json')) as file:
    configData = json.load(file)


# parse configdata

# datapack name
datapackDisplayName = configData['datapackDisplayName']
datapackFullName = configData['datapackFullName']
datapackFullName_lower = datapackDisplayName.replace(" ", "").lower()

# datapack id
datapackID = configData['datapackID']
datapackID_lower = datapackID.lower()

# datapack color
datapackColor = configData['datapackColor']

# pack version
datapackPackVersion = configData['datapackPackVersion']

# description
datapackDescription = configData['datapackDescription']

# datapack version
datapackDisplayVersion = configData['datapackDisplayVersion']
datapackFullVersion = ''.join([n for n in datapackDisplayVersion if n.isdigit()])

# datapack manager version
datapackManagerDisplayVersion = configData['datapackManagerDisplayVersion']
datapackManagerFullVersion = datapackManagerDisplayVersion[2:-3]



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



# datapack manager
# versioning system

# set up files in order
# >>>datapackmanager-{datapackManagerDisplayVersion}
# \data
# \pack.mcmeta
# \data\minecraft\tags\functions\load.json

# >>>\data\{datapackFullName_lower}
# \advancements\{datapackFullName}.json

# >>>\functions
# \root
# \effects
# \config.mcfunction
# \installer.mcfunction

# >>>\packages
# \alerts\installed.mcfunction
# \alerts\minecraftnotcompatible.mcfunction
# \hooks
# \hooks\enable.mcfunction
# \hooks\disable.mcfunction
# \hooks\exampledatapack\check.mcfunction
# \preinstaller\load.mcfunction
# \preinstaller\listen.mcfunction
# \preinstaller\initialize.mcfunction
# \versioning\check.mcfunction
# \versioning\throw\dpnotcompatible.mcfunction
# \versioning\throw\mcnotcompatible.mcfunction
# \versioning\updates\v2.00.00.mcfunction
# \tickers\1s-$datapackDisplayVersion.mcfunction
# \tickers\1t-$datapackDisplayVersion.mcfunction
# \slowupdates\update.mcfunction
# \slowupdates\functions\clearschedules.mcfunction
# \slowupdates\functions\disablepack.mcfunction
# \slowupdates\functions\loadconfig.mcfunction
# \slowupdates\functions\uninstall.mcfunction



# create datapack root
# >>>datapackmanager-{datapackManagerDisplayVersion}
datapackrootpath = os.path.join(outputpath,f'{datapackFullName_lower}-{datapackDisplayVersion}')
currentpath = datapackrootpath
workingpath = datapackrootpath
CreatePath(datapackrootpath)

# \data
shutil.copytree(
    os.path.join(sourcepath,f'datapackmanager-{datapackManagerDisplayVersion}','data'),
    os.path.join(workingpath,'data'),
    dirs_exist_ok=True
)

# \pack.mcmeta
workingpath = datapackrootpath
packfile = open(os.path.join(workingpath,'pack.mcmeta'), 'w')

template_packmcmeta = '{{"pack": {{"pack_format": {0},"description": "{1}"}}}}'
content = json.dumps(json.loads(template_packmcmeta.format(datapackPackVersion, datapackDescription)), indent=4)

packfile.write(content)
packfile.close()

# \data\minecraft\tags\functions\load.json
workingpath = os.path.join(datapackrootpath,'data','minecraft','tags','functions')
CreatePath(workingpath)

CopyAndReplace(
    os.path.join(sourcepath,'load.json'),
    os.path.join(workingpath,'load.json'),
    replacements
)



# >>>\data\{datapackFullName_lower}
currentpath = os.path.join(datapackrootpath,'data',f'{datapackFullName_lower}')



# \advancements\{datapackFullName}.json
workingpath = os.path.join(currentpath,'advancements')
CreatePath(workingpath)

CopyAndReplace(
    os.path.join(sourcepath,'$datapackFullName_lower.json'),
    os.path.join(workingpath,f'{datapackFullName_lower}.json'),
    replacements
)



# >>>\functions
currentpath = os.path.join(currentpath,'functions')



# \root
# \effects
CreatePath(os.path.join(currentpath,'root'))
CreatePath(os.path.join(currentpath,'effects'))

# \config.mcfunction
CopyAndReplace(
    os.path.join(sourcepath,'config.mcfunction'),
    os.path.join(currentpath,'config.mcfunction'),
    replacements
)

# \installer.mcfunction
CopyAndReplace(
    os.path.join(sourcepath,'installer-$datapackDisplayVersion.mcfunction'),
    os.path.join(currentpath,f'installer-{datapackDisplayVersion}.mcfunction'),
    replacements
)



# >>>\packages
currentpath = os.path.join(currentpath,'packages')



# \alerts\installed.mcfunction
# \alerts\minecraftnotcompatible.mcfunction
workingpath = os.path.join(currentpath,'alerts')
CreatePath(workingpath)

CopyAndReplace(
    os.path.join(sourcepath,'packages','alerts','installed.mcfunction'),
    os.path.join(workingpath,'installed.mcfunction'),
    replacements
)

CopyAndReplace(
    os.path.join(sourcepath,'packages','alerts','minecraftnotcompatible.mcfunction'),
    os.path.join(workingpath,'minecraftnotcompatible.mcfunction'),
    replacements
)

# \hooks
workingpath = os.path.join(currentpath,'hooks')
CreatePath(workingpath)

# \hooks\enable.mcfunction
# \hooks\disable.mcfunction
CopyAndReplace(
    os.path.join(sourcepath,'packages','hooks','enable.mcfunction'),
    os.path.join(workingpath,'enable.mcfunction'),
    replacements
)

CopyAndReplace(
    os.path.join(sourcepath,'packages','hooks','disable.mcfunction'),
    os.path.join(workingpath,'disable.mcfunction'),
    replacements
)

# \hooks\exampledatapack\check.mcfunction
workingpath = os.path.join(currentpath,'hooks','exampledatapack')
CreatePath(workingpath)

CopyAndReplace(
    os.path.join(sourcepath,'packages','hooks','exampledatapack','check.mcfunction'),
    os.path.join(workingpath,'check.mcfunction'),
    replacements
)

# \preinstaller\load.mcfunction
# \preinstaller\listen.mcfunction
# \preinstaller\initialize.mcfunction
workingpath = os.path.join(currentpath,'preinstaller')
CreatePath(workingpath)

CopyAndReplace(
    os.path.join(sourcepath,'packages','preinstaller','load.mcfunction'),
    os.path.join(workingpath,'load.mcfunction'),
    replacements
)

CopyAndReplace(
    os.path.join(sourcepath,'packages','preinstaller','listen.mcfunction'),
    os.path.join(workingpath,'listen.mcfunction'),
    replacements
)

CopyAndReplace(
    os.path.join(sourcepath,'packages','preinstaller','initialize.mcfunction'),
    os.path.join(workingpath,'initialize.mcfunction'),
    replacements
)

# \versioning\check.mcfunction
workingpath = os.path.join(currentpath,'versioning')
CreatePath(workingpath)

CopyAndReplace(
    os.path.join(sourcepath,'packages','versioning','check.mcfunction'),
    os.path.join(workingpath,'check.mcfunction'),
    replacements
)

# \versioning\throw\dpnotcompatible.mcfunction
# \versioning\throw\mcnotcompatible.mcfunction
workingpath = os.path.join(currentpath,'versioning', 'throw')
CreatePath(workingpath)

CopyAndReplace(
    os.path.join(sourcepath,'packages','versioning','throw','dpnotcompatible.mcfunction'),
    os.path.join(workingpath,'dpnotcompatible.mcfunction'),
    replacements
)
CopyAndReplace(
    os.path.join(sourcepath,'packages','versioning','throw','mcnotcompatible.mcfunction'),
    os.path.join(workingpath,'mcnotcompatible.mcfunction'),
    replacements
)

# \versioning\updates\v2.00.00.mcfunction
workingpath = os.path.join(currentpath,'versioning','updates')
CreatePath(workingpath)

CopyAndReplace(
    os.path.join(sourcepath,'packages','versioning','updates','v2.00.00.mcfunction'),
    os.path.join(workingpath,'v2.00.00.mcfunction'),
    replacements
)

# \tickers\1s-$datapackDisplayVersion.mcfunction
# \tickers\1t-$datapackDisplayVersion.mcfunction
workingpath = os.path.join(currentpath,'tickers')
CreatePath(workingpath)

CopyAndReplace(
    os.path.join(sourcepath,'packages','tickers','1s-$datapackDisplayVersion.mcfunction'),
    os.path.join(workingpath,f'1s-{datapackDisplayVersion}.mcfunction'),
    replacements
)

CopyAndReplace(
    os.path.join(sourcepath,'packages','tickers','1t-$datapackDisplayVersion.mcfunction'),
    os.path.join(workingpath,f'1t-{datapackDisplayVersion}.mcfunction'),
    replacements
)

# \slowupdates\update.mcfunction
workingpath = os.path.join(currentpath,'slowupdates')
CreatePath(workingpath)

CopyAndReplace(
    os.path.join(sourcepath,'packages','slowupdates','update.mcfunction'),
    os.path.join(workingpath,'update.mcfunction'),
    replacements
)

# \slowupdates\functions\clearschedules.mcfunction
# \slowupdates\functions\disablepack.mcfunction
# \slowupdates\functions\loadconfig.mcfunction
# \slowupdates\functions\uninstall.mcfunction
workingpath = os.path.join(currentpath,'slowupdates','functions')
CreatePath(workingpath)

CopyAndReplace(
    os.path.join(sourcepath,'packages','slowupdates','functions','clearschedules.mcfunction'),
    os.path.join(workingpath,'clearschedules.mcfunction'),
    replacements
)
CopyAndReplace(
    os.path.join(sourcepath,'packages','slowupdates','functions','disablepack.mcfunction'),
    os.path.join(workingpath,'disablepack.mcfunction'),
    replacements
)
CopyAndReplace(
    os.path.join(sourcepath,'packages','slowupdates','functions','loadconfig.mcfunction'),
    os.path.join(workingpath,'loadconfig.mcfunction'),
    replacements
)
CopyAndReplace(
    os.path.join(sourcepath,'packages','slowupdates','functions','uninstall.mcfunction'),
    os.path.join(workingpath,'uninstall.mcfunction'),
    replacements
)