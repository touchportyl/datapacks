import os
import glob

# replace version number in all folder names, file names, and within files 

# replacement tags
replacements = {
    'v1.00.00':'v1.01.00',
    'set VERSION$datapack.current AroundTheWorld 10000':'set VERSION$datapack.current AroundTheWorld 10100'
}

# create output folder
outputPath = os.path.join(os.path.dirname(os.path.abspath(__file__)),'output')
if not os.path.exists(outputPath):
    os.makedirs(outputPath)

# get all files in input
for ext in ['mcmeta','json','mcfunction']:
    for filepath in glob.iglob(f'./Update Datapack/input/**/*.{ext}', recursive=True):

        # get paths
        inpath = os.path.normpath(filepath)
        outpath = inpath.replace('input','output')

        # replace folder and file names
        for src, target in replacements.items():
            outpath = outpath.replace(src, target)

        outpath_split = os.path.split(outpath)

        # ensure that outpath directory exists
        if not os.path.exists(outpath_split[0]):
            os.makedirs(outpath_split[0])

        # replace file contents
        with open(inpath) as infile, open(outpath, 'w') as outfile:
            for line in infile:
                for src, target in replacements.items():
                    line = line.replace(src, target)
                    outfile.write(line)