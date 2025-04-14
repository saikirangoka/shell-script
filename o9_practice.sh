#!/bin/bash

USERIDI=$(id -u)

if [ $USERIDI -ne 0 ]
then
    echo "You must need to have root access for installing"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "installing mysql... is failed"
        exit 1
    else
        echo "installing mysql... is success"
    fi
else
    echo "mysql is already installed"
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
        echo "installing git... is pass"
    fi
else
    echo "git is already installed"
fi