# EasyScripts
use full scripts for manage your projects.
## Script1-(clone all project)
by use this script you can clone all project by define folder structure, the following json model is use for define foldering structure:
```
[
  {
     "Directory":"your path",
     "Projects":[{"FolderName":"name of your repo folder","Address":"github url"},......],
     "SubDirectory":[ 
       {
          "Directory":"your path",
          "Projects":[],
          "SubDirectory":[]
       },
    ....
     ]
 }
]

```
you can download sample here [Easy-Microservice.json](https://github.com/mahdidelzendeh72/EasyScripts/blob/develop/Script1-(clone%20all%20project)/Easy-Microservice.json).
#### Tip: use multy-Line format comment `/* your comment*/`  for comment on your json file. dont use single line format comment `//coment`.

## Script2-(set upstream and fork config)
by use this script you can Set your fork address and upstream address, infact this script replace your orgin with yor fork and set your old origin for your upstream,
you can have follow option:
- $targetDir: allow you chose a root folder for run script.
```
[string]$targetDir="D:\\EasyMicroServices",
```
- $excludeRepos: allow you skip some folder name in your root folder, the script command dont run in this folders.
```	
[string]$excludeRepos= "GitHub,Projects",
```

- $stopDir:the folder name where you stop go in deeps of directory: here is .git folder
```
[string]$stopDir= ".git",
```
- $yourFork:yourfork url specification
```
[string]$yourFork="mahdidelzendeh72",
```
- $upstreamFork: upstream fork url specification
```	
[string]$upstreamFork="EasyMicroservices"	
```
## Script3-(update your fork from upstream)
Easily update and synce your fork from upstream fork by one click!!
