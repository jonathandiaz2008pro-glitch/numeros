@echo off
title Finora - Generando APK
color 0A
echo.
echo  ==========================================
echo    FINORA - Generando APK para Android
echo  ==========================================
echo.

REM Verificar Java
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo  [ERROR] Java no esta instalado.
    echo.
    echo  Descarga JDK 17 desde:
    echo  https://adoptium.net/
    echo.
    pause
    exit /b 1
)

echo  [OK] Java detectado
echo.

REM Ir a carpeta android y compilar
cd /d "%~dp0android"

echo  Compilando APK de debug...
echo  (Esto puede tardar 2-5 minutos la primera vez)
echo.

call gradlew.bat assembleDebug --no-daemon

if %errorlevel% neq 0 (
    echo.
    echo  [ERROR] Fallo al compilar.
    echo  Asegurate de tener Android SDK instalado.
    echo  Descarga Android Studio desde: https://developer.android.com/studio
    echo.
    pause
    exit /b 1
)

echo.
echo  ==========================================
echo   APK generado con exito!
echo  ==========================================
echo.
echo  Ubicacion del APK:
echo  %~dp0android\app\build\outputs\apk\debug\app-debug.apk
echo.
echo  Para instalar en tu movil:
echo  1. Conecta el movil por USB
echo  2. Activa "Depuracion USB" en Opciones de desarrollador
echo  3. Ejecuta: adb install app-debug.apk
echo.
pause
