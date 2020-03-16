@ECHO OFF

REM ******************************************************************
REM Version: 1.0													 *
REM History															 *
REM Date			    Author		 Description							 *
REM         			Arun		   Siebel Full Compile					 *
REM ******************************************************************

REM SRF Full COMPILATION
SET toolsRoot=E:\Siebel\8.2.2.0.0\Tools_1
SET privUsr=SADMIN
SET privUsrPwd=<password>
SET srfPath=E:\SRFs
SET srfName= %srfPath%\%date%.srf


ECHO %date% %time% close opne tools session if exists.
ECHO pause 10s
ping -n 10 -w 1000 127.0.0.1 > nul
for /f "tokens=1,2 delims= " %%i in ('tasklist /fi "IMAGENAME eq siebdev.exe" /fo TABLE /nh') do if '%%i'=='siebdev.exe' taskkill /F /T /PID %%j
ECHO pause 10s
ping -n 10 -w 1000 127.0.0.1 > nul
ECHO %date% %time% start compile
Start /wait %toolsRoot%\bin\siebdev.exe /c %toolsRoot%\bin\ENU\tools.cfg /d ServerDataSrc /u %privUsr% /p %privUsrPwd% /tl ENU /bc "Siebel Repository" %srfName%
echo pause 10s
ping -n 10 -w 1000 127.0.0.1 > nul
pause
