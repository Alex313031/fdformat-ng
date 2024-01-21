@ECHO OFF
ECHO Packaging fdform18.zip...

DEL fdform18.zip
pkzip -rp fdform18.zip @list.txt
;pkzip -f -rp fdform18.zip @list.txt
