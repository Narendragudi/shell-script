#!/bin/bash

ID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ] 
    then
        echo "ERROR:: $2 .... failed"
        exit 1
    else
        echo "$2 .... SUCCESS"
    fi
}

if [ $ID -ne 0 ]
then
    echo "ERROR:: please run this script with root access"
    exit 1
else
    echo "you are root user"
fi

yum install mysql -y

VALIDATE $? "Installing MYSQL"

yum install git -y

VALIDATE $? "Installing GIT"