::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFB9VWg2GfGWGIroL5uT07u6Unh9LDN00cYzQ5bKHOOUB1Unrcplj33lV+A==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZksaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbCXqZg==
::ZQ05rAF9IAHYFVzEqQJifkN/RQeJGmKiA6d8
::eg0/rx1wNQPfEVWB+kM9LVsJDFbUZFSxD7YX1+7y9++V7EgFUYI=
::fBEirQZwNQPfEVWB+kM9LVsJDFbUZFSxD7YX1+7y9++V7EgFUYI=
::cRolqwZ3JBvQF1fEqQIWIQMUfguAMGSiQaZcur6jr8+VsEIPNA==
::dhA7uBVwLU+EWFSX4Fc0IRQAGWQ=
::YQ03rBFzNR3SWATE+VEkPR9dQ1DXXA==
::dhAmsQZ3MwfNWATE+VEkPR9dQ1DXXA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRmJ9UY1LFtWVUSPL3+vArwTvL2b
::Zh4grVQjdCyDJGyX8VAjFB9VWg2GfGWGIroL5uT07u6Unh9LDN00cYzQ5bKHOOUBpED8cPY=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off

setlocal
call :setESC
cls

set name=%ESC%[32m[%ESC%[34m268 Kick Fixer%ESC%[32m]%ESC%[0m
title="268 Kick Fixer | By: mstudio45"

net.exe session 1>NUL 2>NUL || (
	ECHO %name% %ESC%[31mPlease run this program as Administrator.%ESC%[0m
	pause
	exit
)

REM  ---- FIRST PART ----

echo %name% %ESC%[33mStarting...%ESC%[0m
cd "%UserProfile%\AppData\Local\Roblox\Versions"

set fileFoundInLocal=
set fileFoundInProgramFiles=

echo %name% %ESC%[33mChecking files...%ESC%[0m

echo %ESC%[0m-----------------------------------------------------------

FOR /R "%UserProfile%\AppData\Local\Roblox\Versions" %%a  in (RobloxPlayerBeta.exe) DO (
    IF EXIST "%%~fa" (
        SET fileFoundInLocal=%%~fa
    )
)
IF EXIST "%fileFoundInLocal%" (
	cd "%fileFoundInLocal%\..\"
	goto fix
) ELSE (
	goto skipfirstpart
)

:skipfirstpart
echo %name% %ESC%[41mFirst part skipped...%ESC%[0m
goto fix2

:fix
IF EXIST "AppSettings.xml" (
    	del "%cd%\AppSettings.xml"
	echo %name% %ESC%[92mFirst part done!%ESC%[0m
) ELSE (
	echo %name% %ESC%[92mFirst part done!%ESC%[0m
)
goto fix2

REM  ---- SECOND PART ----

:fix2
cd "%UserProfile%\AppData\Local\Roblox"
IF EXIST "GlobalBasicSettings_13.xml" (
    	del "%cd%\GlobalBasicSettings_13.xml"
	echo %name% %ESC%[92mSecond part done!%ESC%[0m
) ELSE (
	echo %name% %ESC%[92mSecond part done!%ESC%[0m
)
goto fix3

REM  ---- THIRD PART ----

:fix3
cd "C:\Program Files (x86)\Roblox\Versions"
FOR /R "C:\Program Files (x86)\Roblox\Versions" %%a  in (RobloxPlayerBeta.exe) DO (
    IF EXIST "%%~fa" (
        SET fileFoundInProgramFiles=%%~fa
    )
)
IF EXIST "%fileFoundInProgramFiles%" (
	cd "%fileFoundInProgramFiles%\..\"
	goto fix4
) ELSE (
	goto fix5
)

:fix4
IF EXIST "AppSettings.xml" (
    	del "%cd%\AppSettings.xml"
	goto fix4done
) ELSE (
	goto fix4done
)


:fix4done
echo %name% %ESC%[92mThird part done!%ESC%[0m
goto fix5

REM  ---- FIFTH PART ----

:fix5
echo %ESC%[0m-----------------------------------------------------------
echo %name% %ESC%[33mReinstalling Roblox... (Press "OK" after roblox reinstalled)%ESC%[0m
cd "%UserProfile%\AppData\Local\Roblox"

powershell -c "Invoke-WebRequest -Uri 'https://www.roblox.com/install/setup.ashx' -OutFile '%UserProfile%\Desktop\RobloxPlayerLauncher_temp.exe'"
cd "%UserProfile%\Desktop"
if EXISTS "RobloxPlayerLauncher_temp.exe" (
	goto reinstallRoblox
) ELSE (
	goto errorOnReinstallingRoblox
)
cd "%UserProfile%\Desktop"
goto stop

:reinstallRoblox
call "RobloxPlayerLauncher_temp.exe"
attrib "RobloxPlayerLauncher_temp.exe" -R
del /q "RobloxPlayerLauncher_temp.exe"
echo %name% %ESC%[92mRoblox reinstalled!%ESC%[0m
goto stop

:errorOnReinstallingRoblox
echo %name% %ESC%[41mError on reinstalling roblox. Please reinstall roblox manually...%ESC%[0m
goto stop


REM  ---- LAST PART ----

:stop
echo %ESC%[0m-----------------------------------------------------------
cd %userprofile%\desktop
echo %name% %ESC%[32mNow you can close this window.%ESC%[0m
pause

:setESC
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
  exit /B 0
)
exit /B 0