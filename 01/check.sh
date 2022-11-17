#!/bin/bash
chmod +x ./check.sh

if [[ $1 =~ ^[-+]?[0-9]+([.,][0-9]+)?$ ]] || [[ $1 =~ ^[[:punct:]] ]]
then
    ./print.sh 1
else
    ./print.sh $1
fi
