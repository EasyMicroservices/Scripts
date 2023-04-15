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
you can download sample here [Easy-Microservice.json](./Script1-(clone all project)/Easy-Microservice.json).
#### Tip: use multy-Line format comment `/* your comment*/`  for comment on your json file. dont use single line format comment `//coment`.
