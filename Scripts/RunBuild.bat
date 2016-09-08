   @echo off
   SETLOCAL 
   :: Set path to this script (shell script shenanigans to verify that
   :: this script can be run anywhere without hardcoding path)
   set SCRIPT_PATH=%~dp0
   set SCRIPT_DIR=%~d0
   %SCRIPT_DIR%
   cd %SCRIPT_PATH%\..\..\..\..
   set DEPOT_PATH=%CD%
   cd %SCRIPT_PATH%
   set SCRIPT_PATH=%CD%
   :setDate
   set DATESTRING=%DATE%
   :: Remove weekday
   set DATESTRING_SHORT=%DATESTRING:~-10%
   :: Remove slashes
   set DATESTRING=%DATESTRING_SHORT:/=%
   :: Reformat date into YYYYMMDD
   set YEAR=%DATESTRING:~-4%
   set MONTHDAY=%DATESTRING:~0,4%
   set DATESTRING=%YEAR%%MONTHDAY%
   
   echo %SCRIPT_PATH%
   echo %DATESTRING%
   echo starting the git command
   
   git diff --name-only HEAD~179 HEAD~181 > test.rtf
   
   
   echo Done with the git command 
   :fail 
   echo.
   echo ****************
   echo * BUILD FAILED *
   echo ****************
   ::pause
   ::exit 1
   ::goto end
   
   :success
   echo.
   echo ********************
   echo * SUCCESSFUL BUILD *
   echo ********************
   echo.
    
   :end   
   cd %SCRIPT_PATH%
   ENDLOCAL  
   pause
