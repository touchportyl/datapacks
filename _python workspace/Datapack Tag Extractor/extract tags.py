from os import walk, startfile
from os.path import split, join, dirname, abspath, normpath
from re import findall

# regex
# add more tags
regex = r'\b[A-Z]{2}_\w*'

# datapack to extract tags from
targettxt = join(dirname(abspath(__file__)),'target.txt')
with open(targettxt) as path:
  targetPath = normpath(path.readline())

# get all the files
allFiles = []
for root, dirs, files in walk(targetPath):
  for file in files:
    allFiles.append(join(root, file))

# read every file and regex the tags out
tagList = []
for filePath in allFiles:
  with open(filePath, 'r') as file:
    contents = file.read()
    
    regexResults = findall(regex, contents)
    if regexResults: # if not empty
      # add to tag set
      tagList += set(regexResults)

# once done, save all the tags into a file
savePath, fileName = split(targetPath)
txtPath = join(dirname(abspath(__file__)), 'extracted tags', ''.join([fileName, '-tags.txt']))

with open(txtPath, 'w') as file:
    file.writelines(line + '\n' for line in sorted(list(set(tagList))))

# open the file
startfile(txtPath)

# console log
print(f'\n\nA file containing all the tags in {fileName} has been saved to:\n{txtPath}\n\n')