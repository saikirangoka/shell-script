#!/bin/bash

NUMBER1=$1
NUMBER2=$2

TIMESTAMP=$(date)

SUM=$(($NUMBER1+$NUMBER2))

echo "script executed at : $TIMESTAMP"
echo "sum of two numbers : $SUM"
echo "sum of $1 and $2 : $SUM"