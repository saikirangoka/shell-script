#!/bin/bash

USERIDII=$(id -u)
if [ USERIDII -ne 0 ]
then
    echo "To execute this command you need root access"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install sql -y
    if [ $? -ne 0 ]
    then
        echo "installing mysql... is fail"
        exit 1
    else
        echo "installing mysql... is success"
    fi
else
    echo "myql is already installed"
fi

dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "installing git... is fail"
        exit 1
    else
        echo "installing git... is success"
    fi
else
    echo "git is already installed"