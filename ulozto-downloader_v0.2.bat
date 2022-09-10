@echo OFF
color 0A
set PATH=%PATH%;D:\Tor Browser\Browser\TorBrowser\Tor

set mychar=-
set mynumber=100

set myoutput=F:\cdd\d\
echo File download to %myoutput% 

set /P myurl="Enter url here:"

echo start download:  %date%  %time% >> "ulozto-downloader history.txt"
echo URL:  %myurl% >> "ulozto-downloader history.txt"
echo start download:  %date%  %time%

python Scripts\ulozto-downloader.exe --parts 5 --output %myoutput% %myurl%

echo stop download:  %date%  %time% >> "ulozto-downloader history.txt"
echo stop download:  %date%  %time%

for /l %%i IN (2,1,%mynumber%) DO CALL set "mychar=%%mychar%%%mychar%"
echo %mychar% >> "ulozto-downloader history.txt"

del /P %myoutput%*.ucache
del /P %myoutput%*.udown
pause