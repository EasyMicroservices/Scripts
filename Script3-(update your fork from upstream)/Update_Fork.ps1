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



Function Update-Fork{	
	param (
    [Parameter(ValueFromPipeline)]
	[ValidateNotNullOrEmpty()]
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
				
				 $sub.FullName | Update-Fork;
			}
			else{
				Write-Host("--------------Folder Name: '" + $sub.FullName + "'---------------")  -ForegroundColor green ;
				 cd $sub.FullName;
		       	 $curBranch = $(git branch --show-current);
			     $curBranch = $curBranch.Trim();
		         Write-Host("..........................updating current branch '" + $curBranch + "' ..........................") -ForegroundColor Red;
				 git pull upstream $curBranch;
				 if($canPushToOrigin){
					 git push origin $curBranch;
				 }
				 if($canUpdateAllBranches){
					    $branches = $(git branch);
					    foreach($branch in $branches) {
						  $branch = $branch.Replace("* ","");
				          $branch = $branch.Trim();
						  if($curBranch.CompareTo($branch) -ne 0){
            
					         Write-Host("..........................updating branch '" + $branch + "' ..........................") -ForegroundColor Red;

					         git checkout "$branch" -q;
            
					         git pull upstream $branch;
							 if($canPushToOrigin){
								 git push origin $branch;
								
				              }
					
				            }
					    }
						git checkout "$curBranch" -q;
				    }
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
"D:\\EasyMicroServices" | Update-Fork; 
Write-Host -NoNewLine 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
