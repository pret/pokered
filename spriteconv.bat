@echo off
setlocal

:: Set RGBDS directory
set RGBDS=C:\Users\Alexander\Downloads\rgbds-0.8.0-win64

:: Set source directory where .png files are located
set SRC_DIR=C:\Users\Alexander\Desktop\Code\Projects\pokered

:: Convert each .2bpp file to .pic in the source directory and its subdirectories
for /r "%SRC_DIR%\gfx" %%f in (*.2bpp) do (
    echo Converting "%%f" to .pic
    "%SRC_DIR%\pkmncompress.exe" "%%f" "%%~dpnf.pic"
)


echo Conversion complete!
pause
