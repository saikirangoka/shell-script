#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "you must have sudo access to execute the script"
fi

dnf install mysqll -y

if [ $? -ne 0 ]
then
    echo "installing mysql... is fail"
    exit 1
else
    echo "installing mysql... is success"
fi

dnf install git -y
if [ $? -ne 0 ]
then
    echo "installing git... is fail"
    exit 1
else
    echo "installinf git... is success"
fi