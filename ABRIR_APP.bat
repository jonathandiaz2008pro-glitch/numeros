@echo off
title Finora - Servidor local
echo.
echo  Iniciando Finora...
echo.

REM Buscar node.exe
set NODE="C:\Program Files\nodejs\node.exe"
if not exist %NODE% set NODE=node

REM Iniciar servidor en puerto 3000
start "" %NODE% -e "const h=require('http'),fs=require('fs'),p=require('path');h.createServer((req,res)=>{let f=p.join('www',req.url==='/'?'index.html':req.url);fs.readFile(f,(e,d)=>{if(e){res.writeHead(404);res.end();}else{const m={'html':'text/html','js':'application/javascript','json':'application/json','css':'text/css','png':'image/png','svg':'image/svg+xml'};const ext=f.split('.').pop();res.writeHead(200,{'Content-Type':m[ext]||'text/plain'});res.end(d);}});}).listen(3000,()=>console.log('OK'));"

REM Esperar un momento y abrir el navegador
timeout /t 1 /nobreak >nul
start "" "http://localhost:3000"

echo  App abierta en: http://localhost:3000
echo  Cierra esta ventana para apagar el servidor.
echo.
pause
