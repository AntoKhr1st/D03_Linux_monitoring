#!/bin/bash
chmod +x ./print.sh

if [ $1 = 1 ]
then
    echo "Error: invalid format. Enter the text."
else
    echo "$1"
fi
