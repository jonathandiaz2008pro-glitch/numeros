@echo off
title Finora - Instalar en movil
color 0B
echo.
echo  ==========================================
echo    FINORA - Instalando en tu movil
echo  ==========================================
echo.
echo  Asegurate de:
echo  1. Tener el movil conectado por USB
echo  2. Haber activado "Depuracion USB"
echo     (Ajustes - Opciones desarrollador - Depuracion USB)
echo.
echo  Buscando dispositivos conectados...
adb devices
echo.
echo  Instalando Finora...
adb install -r "%~dp0android\app\build\outputs\apk\debug\app-debug.apk"

if %errorlevel% equ 0 (
    echo.
    echo  [OK] Finora instalada correctamente en tu movil!
) else (
    echo.
    echo  [ERROR] No se pudo instalar. Comprueba la conexion USB.
)
echo.
pause
