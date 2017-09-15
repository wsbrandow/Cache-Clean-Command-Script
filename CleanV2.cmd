@echo off

echo. 
echo  **********************************************
echo  ********** Molina IT Service Desk  ***********
echo  ********** Full Cache Clear Script ***********
echo  **********************************************
echo.
echo.

echo. 
echo  ***************************************************************************
echo  ********** This script will close any and all Internet Explorer ***********
echo  ********** processes, clear IE and Chrome caches                ***********
echo  ********** ALL UNSAVED WORK WILL BE LOST!                       ***********
echo  ***************************************************************************
echo.
echo.

pause
taskkill /F /IM iexplore.exe

echo.
echo. 
echo  **********************************************
echo  ********* Starting IE Cache(s) Clear *********
echo  **********************************************
echo.

RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 2
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 16
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 32
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 254
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 4350

echo.
echo.
echo  **********************************************
echo  ****** Starting Chrome Cache(s) Clear ********
echo  **********************************************
echo.


taskkill /F /IM "chrome.exe">nul 2>&1

set ChromeDataDir=C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Default
set ChromeCache=%ChromeDataDir%\Cache>nul 2>&1  
del /q /s /f "%ChromeCache%\*.*">nul 2>&1    
del /q /f "%ChromeDataDir%\*Cookies*.*">nul 2>&1     

set ChromeDataDir=C:\Users\%USERNAME%\Local Settings\Application Data\Google\Chrome\User Data\Default
set ChromeCache=%ChromeDataDir%\Cache>nul 2>&1
del /q /s /f "%ChromeCache%\*.*">nul 2>&1   
del /q /f "%ChromeDataDir%\*Cookies*.*">nul 2>&1    
echo.

echo. 
echo  **********************************************
echo  ********* Starting Cookie Clean-Up ***********
echo  **********************************************
echo.

del "c:\documents and settings\%username%.%userdomain%\cookies\*.*" /q /s /f
del "c:\documents and settings\%username%\cookies\*.*" /q /s /f
cls

echo.
echo. 
echo  **********************************************
echo  ********** Molina IT Service Desk  ***********
echo  ********** Full PC CLEAN OUT Script **********
echo  **********       !COMPLETED!       ***********
echo  **********************************************
echo.
echo.

pause