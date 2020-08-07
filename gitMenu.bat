@ ECHO OFF
CLS
:MENU
ECHO *********************************************************************************************************************
ECHO ----------------------------------------------- Git Batch Tool ------------------------------------------------------
ECHO *********************************************************************************************************************
ECHO ..................................................................................
ECHO PRESS the relevant number next to the menu option
ECHO Option 1 must be set if you have never configured git on this computer
ECHO Option 2 must be set to work with the other menu options
ECHO ..................................................................................
ECHO 1 - Configure Git (username, email)
ECHO 2 - Set Git Path
ECHO 3 - Initialise Repository
ECHO 4 - Git Status
ECHO 5 - Git Add All(stage all local files for committing)
ECHO 6 - Git Commit
SET /P M=Type the number and then press ENTER:
IF %M%==1 GOTO Configure
IF %M%==2 GOTO Path
IF %M%==3 GOTO Repo
IF %M%==4 GOTO Status
IF %M%==5 GOTO gitAdd
IF %M%==6 GOTO gitCommit


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
pause
CLS
GOTO MENU

:Status
cd %gitLocalPath%
git status
pause
CLS
GOTO MENU

:gitAdd
cd %gitLocalPath%
git add .
ECHO Local changes Added
pause
CLS
GOTO MENU

:gitCommit
cd %gitLocalPath%
set /p commitComment=Describe the commit: 
git commit -m "%commitComment%"
pause
CLS
GOTO MENU



