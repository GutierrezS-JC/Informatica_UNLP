@echo off
SET THEFILE=c:\users\juanc\desktop\repaso~1\arboles\aresol~1\ejerci~1\repaso2\ejerci~1.exe
echo Linking %THEFILE%
d:\pascal\dev-pas\bin\ldw.exe  -s   -b base.$$$ -o c:\users\juanc\desktop\repaso~1\arboles\aresol~1\ejerci~1\repaso2\ejerci~1.exe link.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
