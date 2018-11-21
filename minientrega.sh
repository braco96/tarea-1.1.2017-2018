#!/bin/bash


if [ $# != 1 ]; then
    echo "minientrega.sh: Error(64), uso incorrecto del mandao. \"Succes\""
echo "minientrega.sh+ <<descripcion detallada del error>>"
   
exit 64
else
    if [ $1 == "-h" ] ; then
        echo minientrega.sh: Uso: minientrega.sh 
echo minientrega.sh: realiza la entrega de la práctica ID_PRACTICA
        exit 0
elif [ $1 == "--help" ]; then
        echo minientrega.sh: Uso: minientrega.sh 
echo minientrega.sh: realiza la entrega de la práctica ID_PRACTICA
        exit 0 
fi
fi
a=64
b=1 
c=1
d=1
    if ! test $MINIENTREGA_CONF; then
echo minientrega.sh: Error, no se pudo realizar la entrega >&2
 echo minientrega.sh+ no es accesible el directorio $MINIENTREGA_CONF >&2
exit 64
 else
if ! test -d $MINIENTREGA_CONF ; then
echo minientrega.sh: Error, no se pudo realizar la entrega >&2
 echo minientrega.sh+ no es accesible el directorio $MINIENTREGA_CONF >&2
exit 64
else
  if ! test -r $MINIENTREGA_CONF; then
echo minientrega.sh: Error, no se pudo realizar la entrega >&2
 echo minientrega.sh+ no es accesible el directorio $MINIENTREGA_CONF >&2
exit 64
fi
fi
fi
   for archivo in `ls ${MINIENTREGA_CONF}/*`; do
        if  test $archivo == ${MINIENTREGA_CONF}/$1; then
           a=0
        fi
    done

if [ $a == 64 ] ;then
echo minientrega.sh: Error, no se pudo realizar la entrega >&2
 echo minientrega.sh+ no es accesible el archivo >&2
exit 64
fi
source ${MINIENTREGA_CONF}/$1
notacion='[0-9]{4}-[0-1][0-9]-[0-3][0-9]'
    if ! [[ $MINIENTREGA_FECHALIMITE =~ $notacion ]]; then
       echo minientrega.sh: Error, no se pudo realizar la entrega >&2
echo minientrega.sh+ fecha incorrecta $MINIENTREGA_FECHALIMITE >&2
exit 65 
fi

    for fichero in ${MINIENTREGA_FICHEROS}; do
        if test -e ${PWD}/$fichero; then
            if ! test -r ${PWD}/$fichero; then
echo minientrega.sh: Error, no se pudo realizar la entrega >&2
echo minientrega.sh+ no es accesible el fichero $fichero >&2
exit 66
            fi

        else 
echo minientrega.sh: Error, no se pudo realizar la entrega >&2
echo minientrega.sh+ no es accesible el fichero $fichero >&2
exit 66
        fi
    done

    if [ `date +%Y` -gt ${MINIENTREGA_FECHALIMITE:0:4} ]; then  
echo minientrega.sh: Error, no se pudo realizar la entrega >&2
echo minientrega.sh+ fecha incorrecta $MINIENTREGA_FECHALIMITE >&2
exit 65
    elif [ `date +%Y` == ${MINIENTREGA_FECHALIMITE:0:4} ]; then  
        if [ `date +%m` -gt ${MINIENTREGA_FECHALIMITE:5:2} ]; then  
echo minientrega.sh: Error, no se pudo realizar la entrega >&2
echo minientrega.sh+ fecha incorrecta $MINIENTREGA_FECHALIMITE >&2            
exit 65
        elif [ `date +%m` == ${MINIENTREGA_FECHALIMITE:5:2} ]; then  
            if [ `date +%d` -gt ${MINIENTREGA_FECHALIMITE:8:2} ]; then  
echo minientrega.sh: Error, no se pudo realizar la entrega >&2
echo minientrega.sh+ fecha incorrecta $MINIENTREGA_FECHALIMITE >&2                
exit 65
fi
fi
fi



    if ! test $MINIENTREGA_DESTINO; then
      echo  minientrega.sh: Error, no se pudo realizar la entrega >&2
echo minientrega.sh+ no se pudo crear el subdirectorio de entrega en $MINIENTREGA_DESTINO >&2
exit 73
 else
if ! test -d $MINIENTREGA_DESTINO ; then
   echo minientrega.sh: Error, no se pudo realizar la entrega >&2
echo minientrega.sh+ no se pudo crear el subdirectorio de entrega en $MINIENTREGA_DESTINO >&2
exit 73
else
  if ! test -r $MINIENTREGA_DESTINO; then
     echo minientrega.sh: Error, no se pudo realizar la entrega >&2
echo minientrega.sh+ no se pudo crear el subdirectorio de entrega en $MINIENTREGA_DESTINO >&2
exit 73
fi
fi
fi
if ! test -d $MINIENTREGA_DESTINO/$USER && ! test -r $MINIENTREGA_DESTINO/$USER/; then
        mkdir -p $MINIENTREGA_DESTINO/$USER
    fi


cp ${MINIENTREGA_FICHEROS} ${MINIENTREGA_DESTINO}/${USER}/.

