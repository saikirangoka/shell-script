#!/bin/bash

 R="\e[31m"
 G="\e[32m"
 Y="\e[33m"
 N="\e[0m"

 SOURCE_DIRECTORY=$1
 DESTINATION_DIRECTORY=$2
 DAYS=${3:-14}

 LOGS_FOLDER="/home/ec2-user/shellscript-logs/"
 mkdir -p "$LOGS_FOLDER"
 LOG_FILE=$(echo $0 | cut -d "." -f1 )
 TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
 LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

 VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $R Fail $N"
        exit 1
    else
        echo -e "$2 is $G Success $N"
    fi
 }

 echo "Script satrted running at $TIMESTAMP" &>>$LOG_FILE_NAME

 USAGE(){
    echo -e " $R USAGE : $N <source_dirctory> <destination_directory> <Days>"
    exit 1
 }

 if [ $# -lt 2 ]
 then
    USAGE
fi

if [ ! -d "$SOURCE_DIRECTORY" ]
then
    echo -e "$SOURCE_DIRECTORY does not exist please check"
    exit 1
fi

if [ ! -d "$DESTINATION_DIRECTORY" ]
then
    echo -e "$DESTINATION_DIRECTORY does not exist please check"
    exit 1
fi

FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +$DAYS)

#echo "files are : $FILES"

if [ -n "$FILES" ]
then
    echo "Files are : $FILES"
    ZIP_FILE="DESTINATION_DIRECTORY/app-logs-$TIMESTAMP.zip"
    find $SOURCE_DIRECTORY -name "*.log" -mtime +$DAYS | zip -@ "ZIP_FILE"
    if [ -f "$ZIP_FILE" ]
    then
        echo -e "successfully created for files older than $DAYS"
        while read -r filepath
        do
            echo "Deleting file : $filepath"
            rm -rf $filepath
            echo "Deleted file: $filepath"
        done <<< $FILES
    else
        echo -e "$R Error:: $N Failed to create zip file"
        exit 1
    fi
    
else
    echo "no files are older than $DAYS"
fi