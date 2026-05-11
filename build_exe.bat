@echo off
echo Сборка HOMELauncheR в EXE файл...
echo.

REM Сборка проекта с Gradle
gradlew.bat build

REM Создание директории для сборки
if not exist "build\exe" mkdir "build\exe"

REM Копирование JAR файла
copy "app\build\libs\app.jar" "build\exe\HOMELauncheR.jar"

REM Создание BAT файла для запуска
echo @echo off > "build\exe\HOMELauncheR.bat"
echo java -jar "%~dp0HOMELauncheR.jar" %%* >> "build\exe\HOMELauncheR.bat"

REM Создание конвертера в EXE (используем Launch4j)
echo Создание конфигурации Launch4j...
echo ^<?xml version="1.0" encoding="UTF-8"?^> > "build\exe\launch4j_config.xml"
echo ^<launch4jConfig^> >> "build\exe\launch4j_config.xml"
echo   ^<headerType^>gui^</headerType^> >> "build\exe\launch4j_config.xml"
echo   ^<outfile^>HOMELauncheR.exe^</outfile^> >> "build\exe\launch4j_config.xml"
echo   ^<jar^>HOMELauncheR.jar^</jar^> >> "build\exe\launch4j_config.xml"
echo   ^<icon^>icon.ico^</icon^> >> "build\exe\launch4j_config.xml"
echo   ^<classPath^> >> "build\exe\launch4j_config.xml"
echo     ^<mainClass^>homelauncher.HOMELauncheR^</mainClass^> >> "build\exe\launch4j_config.xml"
echo     ^<cp^>HOMELauncheR.jar^</cp^> >> "build\exe\launch4j_config.xml"
echo   ^</classPath^> >> "build\exe\launch4j_config.xml"
echo   ^<jre^> >> "build\exe\launch4j_config.xml"
echo     ^<path^>jre^</path^> >> "build\exe\launch4j_config.xml"
echo     ^<minVersion^>21^</minVersion^> >> "build\exe\launch4j_config.xml"
echo   ^</jre^> >> "build\exe\launch4j_config.xml"
echo   ^<versionInfo^> >> "build\exe\launch4j_config.xml"
echo     ^<fileVersion^>1.0.0.0^</fileVersion^> >> "build\exe\launch4j_config.xml"
echo     ^<txtFileVersion^>1.0.0.0^</txtFileVersion^> >> "build\exe\launch4j_config.xml"
echo     ^<fileDescription^>HOMELauncheR - Minecraft Piracy Edition^</fileDescription^> >> "build\exe\launch4j_config.xml"
echo     ^<copyright^>Gothbreach 2026^</copyright^> >> "build\exe\launch4j_config.xml"
echo     ^<productVersion^>1.0.0.0^</productVersion^> >> "build\exe\launch4j_config.xml"
echo     ^<txtProductVersion^>1.0.0.0^</txtProductVersion^> >> "build\exe\launch4j_config.xml"
echo     ^<productName^>HOMELauncheR^</productName^> >> "build\exe\launch4j_config.xml"
echo     ^<companyName^>Gothbreach Productions^</companyName^> >> "build\exe\launch4j_config.xml"
echo     ^<internalName^>HOMELauncheR^</internalName^> >> "build\exe\launch4j_config.xml"
echo     ^<originalFilename^>HOMELauncheR.exe^</originalFilename^> >> "build\exe\launch4j_config.xml"
echo   ^</versionInfo^> >> "build\exe\launch4j_config.xml"
echo ^</launch4jConfig^> >> "build\exe\launch4j_config.xml"

echo.
echo Для создания EXE файла:
echo 1. Установите Launch4j: http://launch4j.sourceforge.net/
echo 2. Запустите Launch4j
echo 3. Откройте файл: build\exe\launch4j_config.xml
echo 4. Нажмите "Build wrapper"
echo.
echo Или используйте готовый BAT файл: build\exe\HOMELauncheR.bat
echo.
echo Сборка завершена!
pause