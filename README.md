# EasyScripts
use full scripts for manage your projects.
## Script1-(clone all project)
by use this script you can clone all project by define folder structure, the following json model is use for define foldering structure:
```javascript
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
```ps1
[string]$targetDir="D:\\EasyMicroServices",
```
- $excludeRepos: allow you skip some folder name in your root folder, the script command dont run in this folders.
```	ps1
[string]$excludeRepos= "GitHub,Projects",
```

- $stopDir:the folder name where you stop go in deeps of directory: here is .git folder
```ps1
[string]$stopDir= ".git",
```
- $yourFork:yourfork url specification
```ps1
[string]$yourFork="mahdidelzendeh72",
```
- $upstreamFork: upstream fork url specification
```ps1	
[string]$upstreamFork="EasyMicroservices"	
```
## Script3-(update your fork from upstream)
Easily update and synce your fork from upstream fork by one click!!
you have foolow option
```ps1

  # $targetDir: refer to directory where you want run this script
	[string]$targetDir,
	# $excludeRepos: refer to folder name where you will not check by script
  [string]$excludeRepos= "GitHub,Projects",
	# $stopDir: the folder name where you stop go in deeps of directory: here is .git folder
  [string]$stopDir= ".git",
	# canUpdateAllBranches: =0 ==> not alloawed update other branches
	# canUpdateAllBranches: =1 ==> alloawed update other branches
  [bool]$canUpdateAllBranches= 0,
  # canPushToOrigin: =0 ==> not alloawed push to  orgin
  # canPushToOrigin: =1 ==> alloawed push to  orgin
  [bool] $canPushToOrigin=0	
  ```
## Script4-(Build all dotnet )
Script for build all prtoject in directory .

```ps1
    # $targetDir: refer to directory where you want run this script
    [string]$targetDir,
    # $excludeRepos: refer to folder name where you will not check by script
    [string]$excludeRepos= "GitHub",
    # $stopDir: the folder name where you stop go in deeps of directory: here is .git folder
    [string]$stopDir= ".git",
    #find solution name
    [string]$CompileProj1= ".sln"
```
