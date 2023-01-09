#Copyright (c)  "https://github.com/EasyMicroservices "  date 2023-01-08
#Script for Git clone  All project from Json file
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without
# restriction, including without limitation the rights to use,
# copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following
# conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.


Function Git-Clone-Project{
[CmdletBinding()]
Param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [object]$Object

    )
	
foreach ($record in $Object)
 {
    Write-Host("************Folder Name: '" + $record.Directory + "' *******************")  -ForegroundColor Yellow -BackgroundColor DarkGreen;
	if (Test-Path $record.Directory) {
   
		Write-Host ("Folder $($record.Directory) Exists...") -ForegroundColor Gray;    
	}
	else
	{     
	    $newfolder=	New-Item $record.Directory -ItemType Directory;
		Write-Host ( "Folder $($record.Directory) Created successfully...")-ForegroundColor Gray;
	}
	cd $record.Directory;
    foreach ($project in $record.Projects){
		Write-Host("--------------- clone Repository  '" + $project.FolderName + "' -------------") -ForegroundColor Green;
		 git clone $project.Address $project.FolderName; 		
	}
     
  $record.SubDirectory | Git-Clone-Project;
 }	
 
}
Function Print-Logo{
Write-Host("B@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@B");
Write-Host("B@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@B");
Write-Host("B@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@B");
Write-Host("B@@@@@@@@@@@@@@@@@@@@@@@@@@BPPPPPPPPPPPPPP#@@@@@@@@@@&GPPPPG@@@@@@@GPPPPG&@@@@@@@@@@@@@@@@@@@@@@@@@B");
Write-Host("B@@@@@@@@@@@@@@@@@@@@@@@@@P               ~@@@@@@@@@@!      ?@@@@@J      ~@@@@@@@@@@@@@@@@@@@@@@@@@B");
Write-Host("B@@@@@@@@@@@@@@@@@@@@@@@@@Y    7PPPPPPPPPP#@@@@@@@@@@^       G@@@B       ^@@@@@@@@@@@@@@@@@@@@@@@@@B");
Write-Host("B@@@@@@@@@@@@@@@@@@@@@@@@@5    5@@@@@@@@@@@@@@@@@@@@@^       ~@@@!       ^@@@@@@@@@@@@@@@@@@@@@@@@@B");
Write-Host("B@@@@@@@@@@@@@@@@@@@@@@@@@5    !555555555G@@@@@@@@@@@^   ..   5@P   ..   ^@@@@@@@@@@@@@@@@@@@@@@@@@B");
Write-Host("B@@@@@@@@@@@@@@@@@@@@@@@@@5              :&@@@@@@@@@@^   ~?   ^&^   ?~   ^@@@@@@@@@@@@@@@@@@@@@@@@@B");
Write-Host("B@@@@@@@@@@@@@@@@@@@@@@@@@5    ?GGGGGGGGG#@@@@@@@@@@@^   ~#.   ^   .#~   ^@@@@@@@@@@@@@@@@@@@@@@@@@B");
Write-Host("B@@@@@@@@@@@@@@@@@@@@@@@@@5    5@@@@@@@@@@@@@@@@@@@@@^   ^@J       ?@~   ^@@@@@@@@@@@@@@@@@@@@@@@@@B");
Write-Host("B@@@@@@@@@@@@@@@@@@@@@@@@@Y    ?BBBBBBBBBB#@@@@@@@@@@^   ^@&:     .&@~   ^@@@@@@@@@@@@@@@@@@@@@@@@@B");
Write-Host("B@@@@@@@@@@@@@@@@@@@@@@@@@5               .B@@@@@@@@@^   ^@@Y     Y@@~   ^@@@@@@@@@@@@@@@@@@@@@@@@@B");
Write-Host("B@@@@@@@@@@@@@@@@@@@@@@@@@&5??????????????Y&@@@@@@@@@P~~~P@@@Y~~~Y@@@P~~~5@@@@@@@@@@@@@@@@@@@@@@@@@B");
Write-Host("B@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@B");
Write-Host("B@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@B");
Write-Host("B@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@B");
Write-Host("B@@@@@@@@@@@@@@@@@@@@@@@   https://github.com/EasyMicroservices      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@B");
Write-Host("B@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@B");
	
}

Print-Logo;
$jsonFile=(Get-Content "Easy-Microservice.json" -raw ) ;
$jsonFile=$jsonFile -replace  '(?ms)/\*.*?\*/';
$jsonFile| ConvertFrom-Json |Git-Clone-Project;
Write-Host -NoNewLine 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');