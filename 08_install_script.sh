#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "you must have sudo access to execute the script"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install mysql -y

        if [ $? -ne 0 ]
        then
            echo "installing mysql... is fail"
            exit 1
        else
            echo "installing mysql... is success"
        fi
else
    echo "mysql is already installed"
fi



dnf list installed git

if [ $? -ne 0 ]
dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "installing git.. is fail"
        exit 1
    else
        echo "installing git.. is success"
    fi
else
    echo "git is already installed"
fi


#then
#   echo "mysql.. will be install"
#else
#    echo "mysql is already installed"



#dnf install git -y
#if [ $? -ne 0 ]
#then
#    echo "installing git... is fail"
#    exit 1
#else
#    echo "installinf git... is success"
#fi