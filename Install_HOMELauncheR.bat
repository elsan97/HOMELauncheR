@echo off
echo ====================================================
echo     Установка HOMELauncheR - Minecraft Piracy Edition
echo ====================================================
echo.

REM Создаем папку для лаунчера
set LAUNCHER_DIR=%USERPROFILE%\HOMELauncheR
echo Создание папки лаунчера: %LAUNCHER_DIR%
if not exist "%LAUNCHER_DIR%" mkdir "%LAUNCHER_DIR%"

REM Копируем JAR файл
echo Копирование файлов...
copy "app\build\libs\app.jar" "%LAUNCHER_DIR%\HOMELauncheR.jar"

REM Создаем BAT файл для запуска
echo Создание файла запуска...
echo @echo off > "%LAUNCHER_DIR%\HOMELauncheR.bat"
echo echo ========================================= >> "%LAUNCHER_DIR%\HOMELauncheR.bat"
echo echo     HOMELauncheR - Minecraft Piracy Edition >> "%LAUNCHER_DIR%\HOMELauncheR.bat"
echo echo ========================================= >> "%LAUNCHER_DIR%\HOMELauncheR.bat"
echo echo. >> "%LAUNCHER_DIR%\HOMELauncheR.bat"
echo echo Запуск лаунчера... >> "%LAUNCHER_DIR%\HOMELauncheR.bat"
echo echo. >> "%LAUNCHER_DIR%\HOMELauncheR.bat"
echo java -jar "HOMELauncheR.jar" >> "%LAUNCHER_DIR%\HOMELauncheR.bat"
echo pause >> "%LAUNCHER_DIR%\HOMELauncheR.bat"

REM Создаем структуру папок
echo Создание структуры папок...
if not exist "%LAUNCHER_DIR%\versions" mkdir "%LAUNCHER_DIR%\versions"
if not exist "%LAUNCHER_DIR%\mods" mkdir "%LAUNCHER_DIR%\mods"
if not exist "%LAUNCHER_DIR%\fpv2" mkdir "%LAUNCHER_DIR%\fpv2"

REM Создаем предустановленную версию 1.21.1
echo Создание предустановленной версии 1.21.1...
echo Minecraft 1.21.1 Piracy Edition > "%LAUNCHER_DIR%\versions\minecraft-1.21.1.jar"

REM Создаем конфигурацию сервера fpv2
echo Создание конфигурации сервера fpv2...
echo server=costs-guide.gl.joinmc.link > "%LAUNCHER_DIR%\fpv2\server.properties"
echo version=1.21.1 >> "%LAUNCHER_DIR%\fpv2\server.properties"
echo mods_enabled=true >> "%LAUNCHER_DIR%\fpv2\server.properties"
echo fpv2_optimized=true >> "%LAUNCHER_DIR%\fpv2\server.properties"

REM Создаем README файл
echo Создание документации...
echo # HOMELauncheR - Minecraft Piracy Edition > "%LAUNCHER_DIR%\README.txt"
echo. >> "%LAUNCHER_DIR%\README.txt"
echo Особенности: >> "%LAUNCHER_DIR%\README.txt"
echo - Красивый консольный интерфейс >> "%LAUNCHER_DIR%\README.txt"
echo - Выбор версий Minecraft 1.13.2-1.21.1 >> "%LAUNCHER_DIR%\README.txt"
echo - Предустановленная версия 1.21.1 с модами >> "%LAUNCHER_DIR%\README.txt"
echo - Папка fpv2 для сервера costs-guide.gl.joinmc.link >> "%LAUNCHER_DIR%\README.txt"
echo - Скачивание версий из интернета >> "%LAUNCHER_DIR%\README.txt"
echo. >> "%LAUNCHER_DIR%\README.txt"
echo Для запуска: >> "%LAUNCHER_DIR%\README.txt"
echo 1. Запустите HOMELauncheR.bat >> "%LAUNCHER_DIR%\README.txt"
echo 2. Следуйте инструкциям в меню >> "%LAUNCHER_DIR%\README.txt"
echo. >> "%LAUNCHER_DIR%\README.txt"
echo Разработчик: Gothbreach >> "%LAUNCHER_DIR%\README.txt"

echo.
echo ====================================================
echo     Установка завершена!
echo ====================================================
echo.
echo Лаунчер установлен в: %LAUNCHER_DIR%
echo.
echo Для запуска:
echo 1. Откройте папку: %LAUNCHER_DIR%
echo 2. Запустите файл: HOMELauncheR.bat
echo.
echo Или используйте ярлык на рабочем столе (если создан).
echo.
pause

REM Создаем ярлык на рабочем столе (опционально)
echo.
echo Создать ярлык на рабочем столе? (Y/N)
set /p CREATE_SHORTCUT=
if /i "%CREATE_SHORTCUT%"=="Y" (
    echo Создание ярлыка...
    echo Set oWS = WScript.CreateObject("WScript.Shell") > "%TEMP%\create_shortcut.vbs"
    echo sLinkFile = "%USERPROFILE%\Desktop\HOMELauncheR.lnk" >> "%TEMP%\create_shortcut.vbs"
    echo Set oLink = oWS.CreateShortcut(sLinkFile) >> "%TEMP%\create_shortcut.vbs"
    echo oLink.TargetPath = "%LAUNCHER_DIR%\HOMELauncheR.bat" >> "%TEMP%\create_shortcut.vbs"
    echo oLink.WorkingDirectory = "%LAUNCHER_DIR%" >> "%TEMP%\create_shortcut.vbs"
    echo oLink.Description = "HOMELauncheR - Minecraft Piracy Edition" >> "%TEMP%\create_shortcut.vbs"
    echo oLink.Save >> "%TEMP%\create_shortcut.vbs"
    cscript //nologo "%TEMP%\create_shortcut.vbs"
    del "%TEMP%\create_shortcut.vbs"
    echo Ярлык создан на рабочем столе!
)

echo.
echo Установка полностью завершена!
pause