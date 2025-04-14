#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"

USERIDI=$(id -u)


VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $R failed"
        exit 1
    else
        echo "$2 is $G success"
    fi
}
if [ $USERIDI -ne 0 ]
then
    echo "You must need to have root access for installing"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "Installing Mysql..."
else
    echo -e "mysql is already $Y installed"
fi

dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Installing git..."
else
    echo -e "git is already $Y installed"
fi