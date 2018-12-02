#!/bin/bash
#
#---- Variables ----#
verdeC="\033[1;32m"
  greenC="\033[0m"
moradoC="\033[1;35m"
 purpuraC="\033[0m"
rojoC="\033[1;31m"
 redC="\033[0m"
amarilloC="\033[1;33m"
 yellowC="\033[0m"
cyan="\033[1;36m"
 cyanC="\033[0m"

carpeta=Killer
oculta=.Killer

pwd="/sdcard/"
#-------------------#
#
  clear
function Carpeta {
   sleep 2
    mkdir $pwd/$carpeta
   if [ $? -eq 0 ];
    then
  echo -e "$amarilloC Carpeta $carpeta Creada Exitosamente $yellowC"
   else
    echo -e "$rojoC Error Al Crear La Carpeta $carpeta  $redC"
  fi
}
function Ejecucion {
     sleep 2
 for ciclo in = == === ==== ======= ========= ===========  ============== =================================================;do
      printf "$(clear) Cargando Espere: $ciclo";
           sleep 1
    done
  echo;
}
function Menu {
 echo -e "$verdeC -----------  MeNu  ----------- $greenC"
 echo -e "$cyan    • Corromper Directorio  [1]  $cyanC"
 echo -e "$cyan    • Ocultar Directorio    [2]  $cyanC"
 echo -e "$cyan    • Desocultar Directorio [3]  $cyanC"
 echo -e "$rojoC   • salir                  [0]  $redC"
 read -p '   -> ' opcn
}
function Corromper {
  case $opcn in
    1)
      echo -e "$amarilloC Corrompiendo Directorio $carpeta $yellowC"
        sleep 2
     echo -e "$verdeC Ingrese una Contraseña $greenC"
        sleep 1
     ccrypt -e -r $pwd/$carpeta
           if  [ $? -eq 0 ];
             then
         echo -e "$verdeC Encryptado Completo $greenC"
               sleep 2
  echo -e "$amarilloC Seguro Quiere eliminar el Directorio $carpeta [Y/N] $yellowC"
          read -p ' >>> ' yn
      if [ $yn = Y ] || [ $yn = y ];
        then
       rm -r $pwd/$carpeta
             if [ $? -eq 0 ];
               then
        echo -e "$verde Sea Corrompido Y Eliminado El Directorio $carpeta $greenC"
           sleep 2
        else
          echo -e "$rojoC Error al Eliminar El Directorio $carpeta $redC"
             sleep 2
         fi
      elif [ $yn = N ] || [ $yn = n ];
          then
      echo -e "$rojoC Directorio Ubicado en La ruta: $redC"
      echo -e "$amarilloC $(pwd $carpeta) $yellowC"
         sleep 2
       else
        echo -e "$rojoC Comando Not Found $redC"
       fi
     else
       echo -e "$rojoC Error Al Cifrar el Directorio $carpeta $redC"
    fi
      ;;
    2)
      echo -e "$cyan Ocultando Directorio $carpeta $cyanC"
        mv $pwd/$carpeta $pwd/$oculta
           sleep 2
         if [ $? -eq  0 ];
           then
            echo -e "$verdeC Directorio $carpeta Ocultado $greenC"
          elif [ $? -eq 1 ];
            then
             echo -e "$rojoC Error al Ocutar directorio $carpeta $redC"
        else
          echo -e "$rojoC Comando Not Found $redC"
       fi
      ;;
    3)
      echo -e "$cyan Desocultando Directorio $carpeta $cyanC"
       mv $pwd/$oculta $pwd/$carpeta
           sleep 2
         if [ $? -eq  0 ];
           then
            echo -e "$verdeC Directorio $carpeta desocultado $greenC"
          elif [ $? -eq 1 ];
            then
             echo -e "$rojoC Error al Desocultar directorio $carpeta $redC"
        else
          echo -e "$rojoC Comando Not Found $redC"
       fi
      ;;
    0)
      echo -e "$rojoC Saliendo del Script $redC"
         sleep 2
      ;;
    *)
      echo -e "$rojoC Comando Not Found $redC"
      ;;
 esac
}
echo -e "$amarilloC Verificando Existencia del directorio $carpeta $yellowC"
    if  [ -d $pwd/$carpeta ] || [ -d $pwd/$oculta ];
      then
       sleep 3
echo -e "$verdeC El directorio $carpeta ya existe\n   ENTER para Poder Continuar ... $greenC"
   read readEnterKey
     Ejecucion
      Menu
       Corromper
 else
 sleep 1
echo  -e "$rojoC el directorio $carpeta No Existe $redC"
    sleep 1.5o
echo -e "$moradoC Desea Crear La Carpeta $carpeta [Y/N] $purpuraC"
  read -p '•••> ' opcion
 if [ $opcion = Y ] || [ $opcion = y ];
   then
echo -e "$verdeC Generando Directorio / Carpeta $greenC"
    Carpeta
  elif [ $opcion = N ] || [ $opcion = n ];
    then
echo -e "$rojoC Cancelando Ejecucion del Script $redC"
     else
echo -e "$rojoC Comando Not Found $redC"
  fi
fi
