@echo off
title Programar Apagado Automático - Windows 11
color 0a
cls

:menu
echo.
echo  PROGRAMA DE APAGADO AUTOMATICO
echo  ==============================
echo.
set /p minutos="Ingrese los minutos para el apagado (0 para cancelar): "

:: Validar entrada
if "%minutos%"=="" (
    echo Error: Debe ingresar un valor
    timeout /t 2 >nul
    cls
    goto menu
)

:: Convertir a número
set /a "segundos=minutos*60" 2>nul

if %minutos% EQU 0 (
    shutdown -a
    echo Apagado programado CANCELADO
    pause
    exit
) else if %segundos% GTR 0 (
    shutdown -s -t %segundos%
    echo.
    echo APAGADO PROGRAMADO
    echo -----------------
    echo El equipo se apagará en:
    echo - %minutos% minutos
    echo - %segundos% segundos
    echo.
    echo Para cancelar: Ejecute nuevamente y ingrese 0
    pause
    exit
) else (
    echo Error: Valor no válido. Solo números enteros positivos.
    timeout /t 2 >nul
    cls
    goto menu
)