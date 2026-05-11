@echo off
echo =========================================
echo     HOMELauncheR - Minecraft Piracy Edition
echo =========================================
echo.

REM Проверяем наличие Java
java -version >nul 2>&1
if errorlevel 1 (
    echo Ошибка: Java не установлена!
    echo Установите Java 8 или выше: https://java.com
    pause
    exit /b 1
)

REM Запускаем лаунчер
echo Запуск HOMELauncheR...
echo.

java -jar "app\build\libs\app.jar"

pause