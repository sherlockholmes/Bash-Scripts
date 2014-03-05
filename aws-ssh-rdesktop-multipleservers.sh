#!/bin/bash
#Script para conectarse a multiples servidores usando un alias, 
#Author: Jhon Navarro & Raul Hugo sherlockhugo@gmail.com
#Licencia GPLv2 
# Dependencias: rdesktop y sshpass.
case "$1" in
	# aliasdelserver) comando a ejecutar cuando la variable $1 contenga el alias. 
	"AWS-WEB-001" | "web01" | "148.76.153.137") ssh -i $HOME/lkeydir/web01.pem root@148.76.153.137;;
	"AWS-WEB-003" | "web03" |"192.134.90.1") ssh -i $HOME/keydir/web03.pem root@192.134.90.1 -p 29187;;
	"AWS-WEB-037" | "web37" |"54.67.89.123" ) rdesktop -0 -r clipboard -r disk:test=$HOME/compartida/ 54.67.89.123 -g "1440*1100" -u admin -p micontrasena &;;
	"RSP-MON-001" | "10.10.0.1" | "puente") sshpass -p micontrasena ssh plataforma@10.10.0.1 -p 29523;;
    *    ) echo "Entrada no reconocida";;
esac
#El modo de ejecunción es guardarlo en /usr/local/bin/conectar
#Ejecutar con $ conectar web01 

