@echo off
SET THEFILE=d:\cadp\practica_1\ejercicio_5.exe
echo Linking %THEFILE%
d:\dev-pas\bin\ldw.exe  -s   -b base.$$$ -o d:\cadp\practica_1\ejercicio_5.exe link.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
