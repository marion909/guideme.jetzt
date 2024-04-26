@echo off
title Backup Script
@echo Computername: %computername%

set rootpath=%cd%
@echo Rootpath: %rootpath% 
echo [38mMuss: C:/CGM/_Backup sein!!! [0m

set currentuser=%USERNAME%
@echo Username: %currentuser%
@echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
:Start
::#region Abfrage Backup
@echo OFF
ECHO Moechten Sie ein Backup erstellen oder die Daten aus einem Backup wiederherstellen? 
ECHO ("0=Backup, 1=Beenden")
SET /p kopieren=
if '%kopieren%' == '0' goto Backup
if '%kopieren%' == '1' goto Ende

::#endregion

:Backup
::#region Abfrage Start Copy
@echo OFF
ECHO Moechten Sie mit dem kopieren Starten? (j / n)
SET /p kopieren=
if '%kopieren%' == 'n' goto Nein
if '%kopieren%' == 'j' goto Ja
:Nein
goto Ende
:Ja
::#endregion

::#region Create Folders
mkdir %computername%
cd %computername%
mkdir C
cd C
if exist "C:\HCS" (
mkdir HCS
)
if exist "C:\gkkdfu" (
mkdir gkkdfu
)
mkdir CGM
mkdir Benutzer
cd CGM
mkdir PCPO
if exist "C:\CGM\HCS" (
mkdir HCS
)
cd..
cd Benutzer
mkdir User
cd User
mkdir Desktop
mkdir Downloads
mkdir Dokumente
mkdir Bilder
mkdir Favoriten
::#endregion

::#region Copy PCPO Data 
@echo off
if exist "C:\CGM\PCPO" (
@echo Kopiere PCPO Daten
ROBOCOPY C:\CGM\PCPO %rootpath%/%computername%/C/CGM/PCPO ad_*.ini /nfl /ndl /njh /njs /ns /nc /np >> %rootpath%/%computername%/errorlog.txt

) else (
@echo Kopiere PCPO Daten
 ROBOCOPY C:\Ado_Med %rootpath%/%computername%/C/CGM/PCPO ad_*.ini /nfl /ndl /njh /njs /ns /nc /np >> %rootpath%/%computername%/errorlog.txt
)
::#endregion

::#region Copy HCS Data
@echo off
if exist "C:\CGM\HCS" (

@echo Kopiere HCS Daten
ROBOCOPY C:\CGM\HCS %rootpath%/%computername%/C/CGM/HCS /s /nfl /ndl /njh /njs /ns /nc /np >> %rootpath%/%computername%/errorlog.txt

) 

if exist "C:\HCS" (
    ROBOCOPY C:\HCS %rootpath%/%computername%/C/HCS /s /nfl /ndl /njh /njs /ns /nc /np >> %rootpath%/%computername%/errorlog.txt
)
::#endregion

::#region Copy Elda Data
@echo off
if exist "C:\gkkdfu" (

@echo Kopiere ELDA Daten
ROBOCOPY C:\gkkdfu %rootpath%/%computername%/C/gkkdfu /s /nfl /ndl /njh /njs /ns /nc /np >> %rootpath%/%computername%/errorlog.txt

) 
::#endregion

::#region Copy User Data
@echo Kopiere Benutzer Daten
ROBOCOPY %UserProfile%\Desktop %rootpath%/%computername%/C/Benutzer/User/Desktop *.* /s /nfl /ndl /njh /njs /ns /nc /np >> %rootpath%/%computername%/errorlog.txt
ROBOCOPY %UserProfile%\Downloads %rootpath%/%computername%/C/Benutzer/User/Downloads *.* /s /nfl /ndl /njh /njs /ns /nc /np >> %rootpath%/%computername%/errorlog.txt
ROBOCOPY %UserProfile%\Dokumente %rootpath%/%computername%/C/Benutzer/User/Dokumente *.* /s /nfl /ndl /njh /njs /ns /nc /np >> %rootpath%/%computername%/errorlog.txt
ROBOCOPY %UserProfile%\Bilder %rootpath%/%computername%/C/Benutzer/User/Bilder *.* /s /nfl /ndl /njh /njs /ns /nc /np >> %rootpath%/%computername%/errorlog.txt
ROBOCOPY %UserProfile%\Favoriten %rootpath%/%computername%/C/Benutzer/User/Favoriten *.* /s /nfl /ndl /njh /njs /ns /nc /np >> %rootpath%/%computername%/errorlog.txt
::#endregion

::#region Create IPCONFIG and Printer TxT 
@echo Erstelle IPConfig.txt
ipconfig /all > %rootpath%/%computername%/IPConfig.txt
@echo Erstelle Drucker.txt
wmic printer list brief > %rootpath%/%computername%/Drucker.txt
::#endregion

::#region Abfrage Errorlog
@echo OFF
ECHO Moechten Sie das Error Log kontrollieren? (j / n)
SET /p wahl=
if '%wahl%' == 'n' goto Nein
if '%wahl%' == 'j' goto Ja
Goto Ende
:Nein
goto Ende
:Ja
start %rootpath%/%computername%/errorlog.txt
goto Ende
::#endregion

goto Start

:End
exit