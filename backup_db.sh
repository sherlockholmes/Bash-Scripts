#!/bin/bash
# Esto debe ejecutarse enviando lcomo parametro el nombre de la base de datos.
# Ejemplo. backupdb.sh nombre_db
cd /mnt/ #posicionarse en una carpeta con espacio
echo "Iniciando backup"
date=$(date +%Y%m%d%H%M)
case "$1" in
        "namedb1" | "namedb2" | "namedb3" |"namedb4") mysqldump -S /vol/lib/mysql/mysql.sock $1 --routines -pPassword > $1$date.sql;; # En este scripts se usan sokets debido a que se hace el backup desde una replica con sandbox
        "namedb3" | "namedb4") mysqldump -S /vol/lib/mysql2/mysql.sock $1 --routines > $1$date.sql;; # Cambiar por mysqldump $1 --routines -u root -pPassword > $1$date.sql;; para ser usar en una base de datos común.
        *    ) echo "Disculpa, BD no Reconocida";;
esac
echo "comprimiendo..."
tar czvf $1$date.sql.tar.gz $1$date.sql
echo "Enviando a ftp.server.com//ruta/carpeta/"$1$date."sql.tar.gz"
ncftpput -R -u userftp -p ftppassword ftp.server.com /ruta/carpeta/ $1$date.sql.tar.gz
echo "Limpiando disco"
rm -rf $1$date.sql
rm -rf $1$date.sql.tar.gz
echo fin
