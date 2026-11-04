@echo off
chcp 65001 >nul
cls
echo ================================================================================
echo       Установка мода "Панель читов" для Ведьмак 3 (Next-Gen / GOTY)
echo ================================================================================
echo.

set "GAME_PATH=C:\GOG Games\The Witcher 3 Wild Hunt GOTY"
if exist "%GAME_PATH%\bin\x64" goto found
if exist "%GAME_PATH%\bin\x64_dx12" goto found

set "GAME_PATH=C:\Program Files (x86)\Steam\steamapps\common\The Witcher 3"
if exist "%GAME_PATH%\bin\x64" goto found
if exist "%GAME_PATH%\bin\x64_dx12" goto found

set "GAME_PATH=D:\Games\The Witcher 3"
if exist "%GAME_PATH%\bin\x64" goto found
if exist "%GAME_PATH%\bin\x64_dx12" goto found

echo Автоматический путь к игре не найден.
echo Скопируйте папки "bin" и "mods" вручную в корневую папку вашей игры.
goto finish

:found
echo Обнаружена игра: "%GAME_PATH%"
echo.
echo Установить мод в эту папку?
set /p choice="Введите Y для установки (или N для отмены): "
if /i "%choice%"=="Y" (
    echo.
    echo Копирование файлов мода...
    xcopy /E /I /Y "bin" "%GAME_PATH%\bin" >nul
    xcopy /E /I /Y "mods" "%GAME_PATH%\mods" >nul
    echo.
    echo ================================================================================
    echo Мод успешно установлен!
    echo В игре откройте: Настройки -^> МОДИФИКАЦИИ
    echo ================================================================================
) else (
    echo Установка отменена.
)

:finish
echo.
pause
