#!/bin/bash

USERIDII=$(id -u)
if [ USERIDII -ne 0 ]
then
    echo "To execute this command you need root access"
fi

R="\e[31m"
G="\e[32m"
Y="\e[33m"
W="\e[0m"


REPEATED(){
    if [ $1 -ne 0 ]
    then
        echo "installing $2... is $R fail $W"
        exit 1
    else
        echo "installing $2... is $G success $W"
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install mysql -y
    REPEATED $? mysql
else
    echo "mysql is already $Y installed $W"
fi

dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    REPEATED $? git
else
    echo "git is already $Y installed $W"
fi