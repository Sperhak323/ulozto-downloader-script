@echo OFF
color 0A

set PATH=%PATH%;D:\Tor Browser\Browser\TorBrowser\Tor
set /P URL="Enter url here:"

python Scripts\ulozto-downloader.exe --parts 5 --output F:\cdd %URL%

pause