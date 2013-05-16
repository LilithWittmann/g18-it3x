@echo off
 
getmac /NH /FO table > c:/mac.temp
set /p mac=<c:/mac.temp
echo Computer Name: "%computername%"
echo Benutzername: "%username%"
 
for /f "tokens=3 delims=," %%a in ('"getmac /v /fo csv | findstr Ethernet"') do echo Mac-Adresse: %%a
 
netsh interface	ip show addresses "Ethernet"
netsh interface ip show dnsservers "Ethernet"
 
 
echo.
echo.
 
 
pause
