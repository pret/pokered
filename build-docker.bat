set srcDir=%~dp0
set imgName=pokered-builder
set romFilename=pokered/pokered.gbc

@REM build rom inside docker
docker build ^
    --target build ^
    -t %imgName% ^
    %srcDir%

@REM copy rom from docker image to source directory
docker run ^
    --name %imgName%-instance ^
    %imgName% ^
    true

docker cp %imgName%-instance:/build/%romFilename% %srcDir%

docker rm %imgName%-instance
