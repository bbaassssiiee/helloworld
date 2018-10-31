#!/bin/bash
set -e
VERSION='%%VERSION%%-%%RELEASE%%'
imcdate(){
   theDate=`date +%Y.%m.%d-%H.%M.%S`
   echo $theDate
}
if [ -z "$1" ]
then
    myLogDir="$HOME/log/$0/`imcdate`"
    mkdir -p $myLogDir
    echo "`imcdate` : INFO : Hello World" > "$myLogDir/hello.log"
    echo 'Hello World!'
else
    if (echo " $1 " | grep -i '\-v' > /dev/null)
    then
        echo "hello.sh $VERSION"
        exit
    fi
fi
