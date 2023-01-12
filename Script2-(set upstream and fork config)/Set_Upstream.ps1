#Copyright (c)  "https://github.com/EasyMicroservices "  date 2023-01-08
#Script for set upstream at the end of url
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without
# restriction, including without limitation the rights to use,
# copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following
# conditions:
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.



Function SetUpstream{	
	param (
    [Parameter(ValueFromPipeline)]
	[ValidateNotNullOrEmpty()]
	# $targetDir: refer to directory where you want run this script
	[string]$targetDir,
	# $excludeRepos: refer to folder name where you will not check by script
    [string]$excludeRepos= "GitHub,Projects",
	# $stopDir: the folder name where you stop go in deeps of directory: here is .git folder
    [string]$stopDir= ".git",
	# yourfork url specification
    [string]$yourFork="mahdidelzendeh72",
	# easy microservice repository url specification
    [string]$upstreamFork="EasyMicroservices"	
 )
 
 if ($targetDir){
	 cd $targetDir; 	
	 Write-Host("**************************Directory Name: '" + $targetDir + "' *******************************")  -ForegroundColor Yellow -BackgroundColor DarkGreen;
	 $subDir = $(Get-ChildItem "$targetDir"  -directory);
	 
	 foreach($sub in $subDir) {
		 
		    if($excludeRepos.Contains($sub.Name)){
				Write-Host("--------------Skip Folder: '" + $sub.Name + "'---------------")  -ForegroundColor gray;
              continue;
            }
	
		    $childSubDir = $(Get-ChildItem "$sub" –force -directory);
			if(-Not $childSubDir.Name.Contains($stopDir) ){
				
				 $sub.FullName | SetUpstream;
			}
			else{
				Write-Host("--------------Folder Name: '" + $sub.FullName + "'---------------")  -ForegroundColor green ;
				cd $sub.FullName;
		        $mainurl=$(git config --get remote.origin.url);
			    git remote add upstream $mainurl;
			    $orginUrl=$mainurl -replace $upstreamFork,$yourFork;			 
			    git remote set-url origin $orginUrl;
			}
			cd $targetDir; 	
	    }	 
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
"D:\\EasyMicroServices" | SetUpstream; 
Write-Host -NoNewLine 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
