#!/bin/bash

if [ $# -ne 1 ]
then
    echo "Attention: needed is one argument!"
else
    in=$1
    ./check.sh $in
fi