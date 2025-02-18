#!/bin/bash

ID=$(id -u)

VALIDATE(){
    if [ $? -ne 0 ] 
    then
        echo "ERROR:: Installing MySQL is failed"
        exit 1
    else
        echo "Installing MySQL is SUCCESS"
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

VALIDATE

yum install git -y

VALIDATE