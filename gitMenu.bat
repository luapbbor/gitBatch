@ ECHO OFF
Title Git Menu Tool
CLS
:MENU
ECHO.
ECHO ----------------------------------------------- Git Menu Tool ------------------------------------------------------
ECHO.
ECHO ............................................................................................................
ECHO.
ECHO PRESS the relevant number next to the menu option
ECHO.
ECHO --Option 1 must be set if you have never configured git on this computer
ECHO.
ECHO --Option 2 must be set (each time you open this batch tool) to work with the other menu options.
ECHO Otherwise, it will be working in the directory you opened this tool from
ECHO.
ECHO ............................................................................................................
ECHO.
IF "%gitLocalPath%"=="" (ECHO The current local repository path is %CD%) ELSE (ECHO The current local repository path is %gitLocalPath%)
ECHO.
ECHO 1 - Configure Git (username, email)
ECHO 2 - Set Local Repository Path
ECHO 3 - Initialise Local Repository
ECHO 4 - Git Status
ECHO 5 - Git Add All(stage all local files for committing)
ECHO 6 - Git Commit
ECHO 7 - Add Remote Repository
ECHO 8 - Git Push (https)
ECHO 9 - View Remote Repository (Relevant to local git path)
ECHO 10 - Clone Remote Repository (https)
ECHO 99 - Exit
ECHO.
SET /P M=Type the number and then press ENTER:
IF %M%==1 GOTO Configure
IF %M%==2 GOTO Path
IF %M%==3 GOTO Repo
IF %M%==4 GOTO Status
IF %M%==5 GOTO gitAdd
IF %M%==6 GOTO gitCommit
IF %M%==7 GOTO addRemoteRepository
IF %M%==8 GOTO gitPush (push commit to remote repository)
IF %M%==9 GOTO viewRemoteRepo
IF %M%==10 GOTO cloneRemoteRepo
IF %M%==99 GOTO exit


:Configure
set /p gitUserName=What is your Git username? 
git config --global user.name %gitUserName%
set /p gitEmail=What is your Git email? 
git config --global user.email %gitEmail%
git config --global --list
pause
GOTO MENU

:Path
cd c:\
set /p gitLocalPath=Enter your repository path: 
ECHO Your Repo path is now: %gitLocalPath%
pause
CLS
GOTO MENU

:Repo
ECHO %gitLocalPath%
cd %gitLocalPath%
git init
ECHO The repo in path %gitLocalPath% has been created
ECHO The command used was: git init
pause
CLS
GOTO MENU

:Status
cd %gitLocalPath%
git status
ECHO The command used was: git status
pause
CLS
GOTO MENU

:gitAdd
cd %gitLocalPath%
git add .
ECHO Local changes Added
ECHO The command used was: git add . (the dot means all files)
pause
CLS
GOTO MENU

:gitCommit
cd %gitLocalPath%
set /p commitComment=Describe the commit: 
git commit -m "%commitComment%"
ECHO The command used was: git commit -m "%commitComment%"
pause
CLS
GOTO MENU

:addRemoteRepository
set /p remoteRepositoryURL=what is the remote repository url? 
git remote add origin %remoteRepositoryURL%
ECHO The Command used was: git remote add origin %remoteRepositoryURL%
pause
CLS
GOTO MENU


:gitPush
cd %gitLocalPath%
git push -u origin master
ECHO The Command used was: git push -u origin master
pause
CLS
GOTO MENU

:viewRemoteRepo
cd %gitLocalPath%
git remote -v
ECHO The command used was: git remote -v
pause
CLS
GOTO MENU

:cloneRemoteRepo
cd %gitLocalPath%
set /p cloneRepoParent=What is the path of the local parent folder you wish to clone to? 
cd %cloneRepoParent%
ECHO The clone will be downloaded to %cloneRepoParent%
set /p cloneRepositoryURL=what is URL of the repo you wish to clone? 
git clone %cloneRepositoryURL%
ECHO The command used was: git clone %cloneRepositoryURL%
pause
CLS
GOTO MENU

:exit
exit






