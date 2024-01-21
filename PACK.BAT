@ECHO OFF
ECHO Packaging fdform19.zip...

DEL fdform19.zip
pkzip -rp fdform19.zip @filelist
;pkzip -f -rp fdform19.zip @filelist
