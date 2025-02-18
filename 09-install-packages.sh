#!/bin/bash

ID=$(id -u)
R="/e[31m"
G="/e[32m"
Y="/e[33m"
N="/e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script started executing ar $TIMESTAMP" &>> $LOGFILE

VALIDATE (){
    [$1 -ne 0 ]
    then 
    echo -e "$2 ...$R FAILED $N"
    else
    echo -e "$2 ...$G SUCCESS $N"
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: please run this script with root access $N"
    exit 1
else
    echo "you are root user"
fi

#echo "All arguments passed: $@"
for package in $@
do
    yum list installed $package &>> $LOGFILE
    if [ $? -ne 0 ]
    then
        yum install $package -y &>> $LOGFILE
        VALIDATE $? "installition of $package"
    else
        echo -e "package is already installed ... $Y SKIPPING $N"
    fi
done