#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "need sudo access"
    exit 1
fi

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscriptlogs/"
LOG_FILE="echo $0 | cut -d "." -f1 "
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE/$TIMESTAMP.log"

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE="echo $0 | cut -d "." -f1"
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "installing $2  is  ${R} failed ${N}"
        exit 1
    else
        echo "installing $2 is ${G} success ${N}"
    fi
}

echo "script started executed at : $TIMESTAMP" &>>LOG_FILE_NAME

for package in $@
do
    dnf list installed $package &>>LOG_FILE_NAME
    if [ $? -ne 0 ]
    then
        dnf install $package -y &>>LOG_FILE_NAME
        VALIDATE $? "$package"
    else
        echo "$package already ${Y} installed ${N}"
    fi
done