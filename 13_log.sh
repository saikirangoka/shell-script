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

LOGS_FOLDER="/var/logs/shellscript-log"
LOGS_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

REPEATED(){
    if [ $1 -ne 0 ]
    then
        echo -e "installing $2... is $R fail $W"
        exit 1
    else
        echo -e "installing $2... is $G success $W"
    fi
}

echo "script started executed at $TIMESTAMP" &>>$LOG_FILE_NAME

dnf list installed mysql &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then
    dnf install mysql -y &>>$LOG_FILE_NAME
    REPEATED $? mysql
else
    echo -e "mysql is already $Y installed $W"
fi

dnf list installed git &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then
    dnf install git -y &>>$LOG_FILE_NAME
    REPEATED $? git
else
    echo -e "git is already $Y installed $W"
fi