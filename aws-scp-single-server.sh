#!/bin/bash
#Script para copiar (cargar y descargar) un archivo o carpeta de un servidor, permitiendo escoger servidor, 
#y rutas de origen y destino.
#Author: Raul Hugo sherlockhugo@gmail.com
#Archivo: 
#inicializar variables
#Licencia GPLv2 
var1='D'
var2='U'
var3='S'
#Mostrar el contenido de las dos variables
echo $var1' = Descargar Archivo'
echo $var2' = Subir Archivo'
echo
echo "Escoja una opcion"
read option
	if [ $option == $var1 ]; 
		then
  			echo "Ingrese server, ruta de archivo de ssh ejemp: /home/aws.pem, puerto, ruta origen, ruta destino"
  			read server llave puerto origen destino
  			echo "Has escogido scp -v -r -P" $puerto" -i" $llave" root@"$server":"$origen" "$destino
             		echo "¿Estas seguro de iniciar descarga? S/N :"
             		read yesno
                     		if [ $yesno == $var3 ] ;
                           		then         
              		          		echo "Iniciando Descarga ....."
            	  		             		scp -v -r -P $puerto -i $llave root@$server:$origen $destino
            	     	 	else 
                            		echo  "Más vale arrepentirse que joder el server"       
                       		fi    
	elif [ $option == $var2 ];
  		then 
            		echo "Ingrese server, ruta de archivo de ssh ejemp: /home/aws.pem, puerto, ruta origen, ruta destino"
            		read server llave puerto origen destino
            		echo "Has escogido scp -v -r -P" $puerto" -i "$llave" "$origen" root@"$server":"$destino
            		echo "¿Estas seguro de iniciar la carga? S/N :"
            		read yesno
                    		if [ $yesno == $var3 ] ;
                          		then         
                                		echo "Iniciando Carga de archivos ....."  
                                      			scp -v -r -P $puerto -i $llave $origen root@$server:$destino 
                          	else 
                                	echo  "Más vale arrepentirse que joder el server"       
                    		fi    
	else
		echo "Escribe en mayusculas"
	fi
#Avisar al usuario que se a terminado de ejecutar el script 
echo ---------Fin del script.-------------
                         
