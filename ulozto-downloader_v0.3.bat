@echo OFF
color 0A
set PATH=%PATH%;D:\Tor Browser\Browser\TorBrowser\Tor

set mychar=-
set mynumber=100
set counter=1

echo Ulozto-Downloader version 0.3 script created by Sperhak.
echo Download 2 files, if you second url leave blank download one file.


set myoutput=F:\cdd\
echo File download to %myoutput% 

set /P myurl_1="Enter url1 here:"
set /P myurl_2="Enter url2 here:"

:set_url
if %counter% == 1 set myurl=%myurl_1%
if %counter% == 2 set myurl=%myurl_2%
if %counter% == 3 goto end

:download
echo start download:  %date%  %time% >> "ulozto-downloader history.txt"
echo URL:  %myurl% >> "ulozto-downloader history.txt"
echo start download:  %date%  %time%

python Scripts\ulozto-downloader.exe --parts 5 --output %myoutput% %myurl%

echo stop download:  %date%  %time% >> "ulozto-downloader history.txt"
echo stop download:  %date%  %time%

for /l %%i IN (2,1,%mynumber%) DO CALL set "mychar=%%mychar%%%mychar%"
echo %mychar% >> "ulozto-downloader history.txt"
set mychar=-

del %myoutput%*.ucache
del %myoutput%*.udown


if %myurl_2%=="" goto end 

set /A counter=%counter%+1
goto set_url

:end
pause



