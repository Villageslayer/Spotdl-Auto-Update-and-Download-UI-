::Universal Spotdl Updater
@echo off & python -x "%~f0" %* 
color a
title HEXAS SPOTDL UPDATER AND DOWNLOADER
cls
:Menu 
ECHO ...............................................
ECHO PRESS 1, 2 OR 3 to select your task, or 4 to EXIT.
ECHO ...............................................
ECHO.
ECHO 1 - Update
ECHO 2 - Setup (run me first)
ECHO 3 - Settings
ECHO 4 - Download new music
ECHO.
SET /P M=Type 1, 2, 3, or 4 then press ENTER:
IF %M%==1 GOTO :Update
IF %M%==2 GOTO :Setup
IF %M%==3 GOTO :Settings
IF %M%==4 GOTO :Download


:Setup 
:: Input TXT DIR
print "please choose the path for TXT Files (both files have to be in the same directory):"
:: picker popup 
setlocal

set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'Please choose Directory.',0,0).self.path""

for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "DIR=%%I"

setlocal enabledelayedexpansion
echo You chose !DIR!
endlocal
::Save Path to file
set Output="%USERPROFILE%\desktop"
echo %DIR% >> %Output%\Dir.txt 
echo Saved Your Path to Dir.txt on your Desktop (dont delete it or you have to setup everything again)
::
cd %DIR%
GOTO :Menu

::
:Settings 
::Set thread amount
set /p st="How many Search Threads? (more = faster search)"
echo you will search with %st% Threads
set /p dt="How many Downlaod Threads? (more = faster downloads)"
echo you will download with %dt% Threads
goto :Menu

:Update
echo Checking for File 
if exist "%USERPROFILE%\desktop\Dir.txt" (
    echo Done
) else (
    echo file not found continuing to setup 
    goto :Setup
)
::Get path from DIR file 
(   set /p LDIR= 
) < %Output%\Dir.txt 

cd %LDIR%


:: Get links from file
(
   set /p link1= 
   set /p link2=
   set /p link3=
   set /p link4=
   set /p link5=
   set /p link6=
   set /p link7=
   set /p link8=
   set /p link9=
   set /p link10=
) < links.txt 
echo "loaded links"

:: Get Directory from file
(
   set /p Dir1=
   set /p Dir2=
   set /p Dir3=
   set /p Dir4=
   set /p Dir5=
   set /p Dir6=
   set /p Dir7=
   set /p Dir8=
   set /p Dir9=
   set /p Dir10=

) < dirs.txt 
echo "loaded directories"

:: Download 1st playlist
cd %Dir1%
echo %Dir1%
spotdl %link1%
cd %Dir2%
echo %DIR2%
spotdl %link2%

goto :Menu 

:Download
echo _________________________/\\\\\\\\\\\____/\\\\\\\\\\\\\_________/\\\\\_______/\\\\\\\\\\\\\\\__/\\\\\\\\\\\\_____/\\\___________________________________________                                           
echo   _______________________/\\\/////////\\\_\/\\\/////////\\\_____/\\\///\\\____\///////\\\/////__\/\\\////////\\\__\/\\\___________________________________________                                          
echo    ______________________\//\\\______\///__\/\\\_______\/\\\___/\\\/__\///\\\________\/\\\_______\/\\\______\//\\\_\/\\\___________________________________________                                         
echo     _______________________\////\\\_________\/\\\\\\\\\\\\\/___/\\\______\//\\\_______\/\\\_______\/\\\_______\/\\\_\/\\\___________________________________________                                        
echo      __________________________\////\\\______\/\\\/////////____\/\\\_______\/\\\_______\/\\\_______\/\\\_______\/\\\_\/\\\___________________________________________                                       
echo       _____________________________\////\\\___\/\\\_____________\//\\\______/\\\________\/\\\_______\/\\\_______\/\\\_\/\\\___________________________________________                                      
echo        ______________________/\\\______\//\\\__\/\\\______________\///\\\__/\\\__________\/\\\_______\/\\\_______/\\\__\/\\\___________________________________________                                     
echo         _____________________\///\\\\\\\\\\\/___\/\\\________________\///\\\\\/___________\/\\\_______\/\\\\\\\\\\\\/___\/\\\\\\\\\\\\\\\_______________________________                                    
echo          _______________________\///////////_____\///___________________\/////_____________\///________\////////////_____\///////////////________________________________                                   
echo  __________________________________________/\\\________/\\\__/\\\\\\\\\\\____________/\\\\\\\\\\\\\____/\\\________/\\\_____________________________________________________________                        
echo   _________________________________________\/\\\_______\/\\\_\/////\\\///____________\/\\\/////////\\\_\///\\\____/\\\/______________________________________________________________                       
echo    _________________________________________\/\\\_______\/\\\_____\/\\\_______________\/\\\_______\/\\\___\///\\\/\\\/________________________________________________________________                      
echo     _________________________________________\/\\\_______\/\\\_____\/\\\_______________\/\\\\\\\\\\\\\\______\///\\\/__________________________________________________________________                     
echo      _________________________________________\/\\\_______\/\\\_____\/\\\_______________\/\\\/////////\\\_______\/\\\___________________________________________________________________                    
echo       _________________________________________\/\\\_______\/\\\_____\/\\\_______________\/\\\_______\/\\\_______\/\\\___________________________________________________________________                   
echo        _________________________________________\//\\\______/\\\______\/\\\_______________\/\\\_______\/\\\_______\/\\\___________________________________________________________________                  
echo         __________________________________________\///\\\\\\\\\/____/\\\\\\\\\\\___________\/\\\\\\\\\\\\\/________\/\\\___________________________________________________________________                 
echo          ____________________________________________\/////////_____\///////////____________\/////////////__________\///____________________________________________________________________                
echo __/\\\________/\\\________/\\\\\\_____/\\\\\\_____________________________________________________________/\\\\\\__________________________________________________________________________________         
echo  _\/\\\_______\/\\\_______\////\\\____\////\\\____________________________________________________________\////\\\__________________________________________________________________________________        
echo   _\//\\\______/\\\___/\\\____\/\\\_______\/\\\_____________________/\\\\\\\\_________________________________\/\\\______________________/\\\__/\\\__________________________________________________       
echo    __\//\\\____/\\\___\///_____\/\\\_______\/\\\_____/\\\\\\\\\_____/\\\////\\\_____/\\\\\\\\___/\\\\\\\\\\____\/\\\_____/\\\\\\\\\______\//\\\/\\\______/\\\\\\\\___/\\/\\\\\\\______________________      
echo     ___\//\\\__/\\\_____/\\\____\/\\\_______\/\\\____\////////\\\___\//\\\\\\\\\___/\\\/////\\\_\/\\\//////_____\/\\\____\////////\\\______\//\\\\\_____/\\\/////\\\_\/\\\/////\\\_____________________     
echo      ____\//\\\/\\\_____\/\\\____\/\\\_______\/\\\______/\\\\\\\\\\___\///////\\\__/\\\\\\\\\\\__\/\\\\\\\\\\____\/\\\______/\\\\\\\\\\______\//\\\_____/\\\\\\\\\\\__\/\\\___\///______________________    
echo       _____\//\\\\\______\/\\\____\/\\\_______\/\\\_____/\\\/////\\\___/\\_____\\\_\//\\///////___\////////\\\____\/\\\_____/\\\/////\\\___/\\_/\\\_____\//\\///////___\/\\\_____________________________   
echo        ______\//\\\_______\/\\\__/\\\\\\\\\__/\\\\\\\\\_\//\\\\\\\\/\\_\//\\\\\\\\___\//\\\\\\\\\\__/\\\\\\\\\\__/\\\\\\\\\_\//\\\\\\\\/\\_\//\\\\/_______\//\\\\\\\\\\_\/\\\_____________________________  
echo         _______\///________\///__\/////////__\/////////___\////////\//___\////////_____\//////////__\//////////__\/////////___\////////\//___\////__________\//////////__\///______________________________ 


setlocal				

set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'Please choose a folder.',0,0).self.path""

for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "folder=%%I"

setlocal enabledelayedexpansion
echo You chose !folder!
endlocal
cd "%folder%"
print "%folder&%
set /p Link=Input spotify link:
cls 

echo _________________________/\\\\\\\\\\\____/\\\\\\\\\\\\\_________/\\\\\_______/\\\\\\\\\\\\\\\__/\\\\\\\\\\\\_____/\\\___________________________________________                                           
echo   _______________________/\\\/////////\\\_\/\\\/////////\\\_____/\\\///\\\____\///////\\\/////__\/\\\////////\\\__\/\\\___________________________________________                                          
echo    ______________________\//\\\______\///__\/\\\_______\/\\\___/\\\/__\///\\\________\/\\\_______\/\\\______\//\\\_\/\\\___________________________________________                                         
echo     _______________________\////\\\_________\/\\\\\\\\\\\\\/___/\\\______\//\\\_______\/\\\_______\/\\\_______\/\\\_\/\\\___________________________________________                                        
echo      __________________________\////\\\______\/\\\/////////____\/\\\_______\/\\\_______\/\\\_______\/\\\_______\/\\\_\/\\\___________________________________________                                       
echo       _____________________________\////\\\___\/\\\_____________\//\\\______/\\\________\/\\\_______\/\\\_______\/\\\_\/\\\___________________________________________                                      
echo        ______________________/\\\______\//\\\__\/\\\______________\///\\\__/\\\__________\/\\\_______\/\\\_______/\\\__\/\\\___________________________________________                                     
echo         _____________________\///\\\\\\\\\\\/___\/\\\________________\///\\\\\/___________\/\\\_______\/\\\\\\\\\\\\/___\/\\\\\\\\\\\\\\\_______________________________                                    
echo          _______________________\///////////_____\///___________________\/////_____________\///________\////////////_____\///////////////________________________________                                   
echo  __________________________________________/\\\________/\\\__/\\\\\\\\\\\____________/\\\\\\\\\\\\\____/\\\________/\\\_____________________________________________________________                        
echo   _________________________________________\/\\\_______\/\\\_\/////\\\///____________\/\\\/////////\\\_\///\\\____/\\\/______________________________________________________________                       
echo    _________________________________________\/\\\_______\/\\\_____\/\\\_______________\/\\\_______\/\\\___\///\\\/\\\/________________________________________________________________                      
echo     _________________________________________\/\\\_______\/\\\_____\/\\\_______________\/\\\\\\\\\\\\\\______\///\\\/__________________________________________________________________                     
echo      _________________________________________\/\\\_______\/\\\_____\/\\\_______________\/\\\/////////\\\_______\/\\\___________________________________________________________________                    
echo       _________________________________________\/\\\_______\/\\\_____\/\\\_______________\/\\\_______\/\\\_______\/\\\___________________________________________________________________                   
echo        _________________________________________\//\\\______/\\\______\/\\\_______________\/\\\_______\/\\\_______\/\\\___________________________________________________________________                  
echo         __________________________________________\///\\\\\\\\\/____/\\\\\\\\\\\___________\/\\\\\\\\\\\\\/________\/\\\___________________________________________________________________                 
echo          ____________________________________________\/////////_____\///////////____________\/////////////__________\///____________________________________________________________________                
echo __/\\\________/\\\________/\\\\\\_____/\\\\\\_____________________________________________________________/\\\\\\__________________________________________________________________________________         
echo  _\/\\\_______\/\\\_______\////\\\____\////\\\____________________________________________________________\////\\\__________________________________________________________________________________        
echo   _\//\\\______/\\\___/\\\____\/\\\_______\/\\\_____________________/\\\\\\\\_________________________________\/\\\______________________/\\\__/\\\__________________________________________________       
echo    __\//\\\____/\\\___\///_____\/\\\_______\/\\\_____/\\\\\\\\\_____/\\\////\\\_____/\\\\\\\\___/\\\\\\\\\\____\/\\\_____/\\\\\\\\\______\//\\\/\\\______/\\\\\\\\___/\\/\\\\\\\______________________      
echo     ___\//\\\__/\\\_____/\\\____\/\\\_______\/\\\____\////////\\\___\//\\\\\\\\\___/\\\/////\\\_\/\\\//////_____\/\\\____\////////\\\______\//\\\\\_____/\\\/////\\\_\/\\\/////\\\_____________________     
echo      ____\//\\\/\\\_____\/\\\____\/\\\_______\/\\\______/\\\\\\\\\\___\///////\\\__/\\\\\\\\\\\__\/\\\\\\\\\\____\/\\\______/\\\\\\\\\\______\//\\\_____/\\\\\\\\\\\__\/\\\___\///______________________    
echo       _____\//\\\\\______\/\\\____\/\\\_______\/\\\_____/\\\/////\\\___/\\_____\\\_\//\\///////___\////////\\\____\/\\\_____/\\\/////\\\___/\\_/\\\_____\//\\///////___\/\\\_____________________________   
echo        ______\//\\\_______\/\\\__/\\\\\\\\\__/\\\\\\\\\_\//\\\\\\\\/\\_\//\\\\\\\\___\//\\\\\\\\\\__/\\\\\\\\\\__/\\\\\\\\\_\//\\\\\\\\/\\_\//\\\\/_______\//\\\\\\\\\\_\/\\\_____________________________  
echo         _______\///________\///__\/////////__\/////////___\////////\//___\////////_____\//////////__\//////////__\/////////___\////////\//___\////__________\//////////__\///______________________________ 

spotdl %Link% 
cmd /k


