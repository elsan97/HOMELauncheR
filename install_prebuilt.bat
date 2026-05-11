@echo off
echo Установка предустановленной версии Minecraft 1.21.1 с модами...
echo.

REM Создание структуры папок
echo Создание структуры папок...
if not exist "%USERPROFILE%\HOMELauncheR" mkdir "%USERPROFILE%\HOMELauncheR"
if not exist "%USERPROFILE%\HOMELauncheR\versions" mkdir "%USERPROFILE%\HOMELauncheR\versions"
if not exist "%USERPROFILE%\HOMELauncheR\mods" mkdir "%USERPROFILE%\HOMELauncheR\mods"
if not exist "%USERPROFILE%\HOMELauncheR\fpv2" mkdir "%USERPROFILE%\HOMELauncheR\fpv2"

REM Создание предустановленной версии
echo Создание предустановленной версии 1.21.1...
echo. > "%USERPROFILE%\HOMELauncheR\versions\minecraft-1.21.1.jar"
echo Minecraft 1.21.1 Piracy Edition > "%USERPROFILE%\HOMELauncheR\versions\minecraft-1.21.1.jar"

REM Создание конфигурации сервера fpv2
echo Создание конфигурации сервера fpv2...
echo server=costs-guide.gl.joinmc.link > "%USERPROFILE%\HOMELauncheR\fpv2\server.properties"
echo version=1.21.1 >> "%USERPROFILE%\HOMELauncheR\fpv2\server.properties"
echo mods_enabled=true >> "%USERPROFILE%\HOMELauncheR\fpv2\server.properties"
echo fpv2_optimized=true >> "%USERPROFILE%\HOMELauncheR\fpv2\server.properties"

REM Создание файла с популярными модами
echo Создание списка модов...
echo # Популярные моды для Minecraft 1.21.1 > "%USERPROFILE%\HOMELauncheR\mods\mods_list.txt"
echo 1. OptiFine - оптимизация графики >> "%USERPROFILE%\HOMELauncheR\mods\mods_list.txt"
echo 2. JourneyMap - карта мира >> "%USERPROFILE%\HOMELauncheR\mods\mods_list.txt"
echo 3. JEI - просмотр рецептов >> "%USERPROFILE%\HOMELauncheR\mods\mods_list.txt"
echo 4. AppleSkin - отображение сытости >> "%USERPROFILE%\HOMELauncheR\mods\mods_list.txt"
echo 5. Xaero's Minimap - мини-карта >> "%USERPROFILE%\HOMELauncheR\mods\mods_list.txt"

echo.
echo Установка завершена!
echo Папка HOMELauncheR создана в: %USERPROFILE%\HOMELauncheR
echo.
echo Содержимое:
echo - versions\minecraft-1.21.1.jar (предустановленная версия)
echo - mods\ (папка для модов)
echo - fpv2\server.properties (конфигурация сервера)
echo.
pause